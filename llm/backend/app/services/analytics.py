import json
import logging
from typing import List, Dict, Any, Optional
import google.generativeai as genai
from pydantic import BaseModel, Field
from sqlalchemy.orm import Session
from app.config import settings
from app.services.query_engine import execute_nl_query

logger = logging.getLogger(__name__)

class ChartRecommendation(BaseModel):
    chart_type: str = Field(description="Type of chart to display: 'bar', 'line', 'pie', 'area', or 'none'")
    x_axis_key: str = Field(description="Field name to display on the X-axis (usually a categorical string key).")
    y_axis_keys: List[str] = Field(description="Field name(s) for the Y-axis (must be numeric values).")
    title: str = Field(description="Title describing the chart visualization.")

class AnalyticMetric(BaseModel):
    label: str = Field(description="Label for this statistic (e.g. 'Average Price', 'Total Records', 'Max Revenue')")
    value: str = Field(description="String value of the statistic (formatted, e.g. '$1,200', '25,000')")

class AnalyticsResponse(BaseModel):
    summary: str = Field(description="Executive summary of the data insights in markdown format.")
    insights: List[str] = Field(description="List of specific key observations, trends, or outliers detected.")
    metrics: List[AnalyticMetric] = Field(description="Summary cards containing key metrics/aggregations.")
    chart: ChartRecommendation = Field(description="Chart recommendation details to feed into the frontend charting library.")

def generate_analytics(
    db: Session,
    user_query: str,
    api_key: Optional[str] = None
) -> Dict[str, Any]:
    """
    1. Runs the query translation and executions.
    2. Takes the query results and passes them to Gemini to generate visual analytics
       and text-based business insights.
    """
    # Step 1: Run the natural language query to get the raw dataset
    query_data = execute_nl_query(db, user_query, api_key=api_key)
    
    if not query_data.get("success", False) or not query_data.get("results"):
        # No results or query failed
        return {
            "success": False,
            "error": query_data.get("error", "No data returned for this query."),
            "sql": query_data.get("sql", ""),
            "summary": "Could not analyze data because no records were found matching the request.",
            "insights": [],
            "metrics": [],
            "chart": {
                "chart_type": "none",
                "x_axis_key": "",
                "y_axis_keys": [],
                "title": "No Data Available"
            },
            "results": []
        }

    results = query_data["results"]
    columns = query_data["columns"]
    sql = query_data["sql"]
    thought = query_data["thought"]
    
    # Limit number of records sent to LLM to prevent token blowup (e.g. top 100 rows)
    data_sample = results[:100]
    
    # Step 2: Feed data to Gemini for analysis
    active_key = api_key or settings.GEMINI_API_KEY
    if not active_key or active_key == "your_gemini_api_key_here":
        raise ValueError("Gemini API key is missing. Please configure it in Settings or your .env file.")

    genai.configure(api_key=active_key, transport="rest")
    
    prompt = f"""
You are an expert Data Analyst and business intelligence dashboard generator.
The user asked: "{user_query}"

We executed the SQL query:
{sql}

And retrieved the following dataset (sample of top 100 records):
{json.dumps(data_sample, indent=2)}

INSTRUCTIONS:
1. Write a clear markdown summary describing the answer to the user's question based on the data.
2. Extract 3-5 specific key insights (trends, outliers, correlations, high/low points).
3. Compute 2-4 key metrics/aggregations (e.g., averages, sums, maximums, minimums) and represent them as label/value pairs.
4. Recommend the best visual chart (bar, line, pie, area, or none) to display this specific dataset. Indicate which keys from the records should map to X-axis and Y-axis. Ensure the keys exist exactly as columns in the data sample. For pie charts, make sure you choose a categorical X-axis and a numeric Y-axis.

OUTPUT FORMAT:
You must return a JSON object conforming exactly to this structure:
{{
  "summary": "executive summary in markdown format",
  "insights": [
    "insight 1",
    "insight 2"
  ],
  "metrics": [
    {{ "label": "metric name", "value": "formatted value" }}
  ],
  "chart": {{
    "chart_type": "bar|line|pie|area|none",
    "x_axis_key": "x_column_name",
    "y_axis_keys": ["y_column_name"],
    "title": "chart title"
  }}
}}
"""

    model = genai.GenerativeModel("gemini-2.5-flash-lite")
    logger.info(f"Generating analytics report using gemini-2.5-flash-lite for user query: {user_query}")
    
    try:
        response = model.generate_content(
            prompt,
            generation_config=genai.types.GenerationConfig(
                response_mime_type="application/json",
                max_output_tokens=4096,
                temperature=0.2
            )
        )
        
        analytics_result = json.loads(response.text)
        
        # Merge raw query data and generated insights
        return {
            "success": True,
            "sql": sql,
            "query_thought": thought,
            "results": results,  # Return the full dataset to the frontend so it can render the chart/table
            "columns": columns,
            "summary": analytics_result.get("summary", ""),
            "insights": analytics_result.get("insights", []),
            "metrics": analytics_result.get("metrics", []),
            "chart": analytics_result.get("chart", {}),
            "execution_time_seconds": query_data.get("execution_time_seconds", 0)
        }
    except Exception as e:
        logger.error(f"Failed to generate analytics with Gemini: {e}")
        # Return fallback response with raw results
        return {
            "success": True,
            "sql": sql,
            "results": results,
            "columns": columns,
            "summary": f"Data fetched successfully. Here is the raw table for: '{user_query}'",
            "insights": ["AI analysis failed to generate. You can explore the data table below."],
            "metrics": [{"label": "Total Rows", "value": str(len(results))}],
            "chart": {
                "chart_type": "bar" if len(columns) > 1 else "none",
                "x_axis_key": columns[0] if columns else "",
                "y_axis_keys": [columns[1]] if len(columns) > 1 else [],
                "title": "Query Results"
            },
            "error": f"AI Insight Generation Error: {str(e)}"
        }
