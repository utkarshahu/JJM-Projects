import React, { useState } from 'react'
import { useStore } from '../store/useStore'
import { 
  BarChart, Bar, LineChart, Line, AreaChart, Area, PieChart, Pie, 
  XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Cell 
} from 'recharts'
import { 
  Search as SearchIcon, 
  Sparkles, 
  Loader2, 
  AlertCircle, 
  PieChart as PieIcon, 
  TrendingUp, 
  ListOrdered, 
  BarChart3 
} from 'lucide-react'

// Beautiful harmonious color palette for charts (Hex equivalents of HSL variables)
const COLORS = ['#6366f1', '#8b5cf6', '#d946ef', '#3b82f6', '#10b981', '#f59e0b', '#ef4444']

export const Analytics: React.FC = () => {
  const { 
    analyticsResult, 
    analyticsLoading, 
    analyticsError, 
    runAnalytics 
  } = useStore()

  const [analyticsQuery, setAnalyticsQuery] = useState('')

  const exampleAnalyticsQueries = [
    "Which districts are most polluted?",
    "Which products have highest ratings?",
    "Which companies are growing fastest?",
    "Show the distribution of revenue across industries",
    "Show record counts across different sources"
  ]

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    if (!analyticsQuery.trim()) return
    runAnalytics(analyticsQuery)
  }

  const handleExampleClick = (q: string) => {
    setAnalyticsQuery(q)
    runAnalytics(q)
  }

  // Helper to render Recharts dynamically based on AI recommendations
  const renderChart = () => {
    if (!analyticsResult || !analyticsResult.results || analyticsResult.results.length === 0) return null
    
    const { chart, results } = analyticsResult
    const data = results
    const type = chart.chart_type?.toLowerCase() || 'bar'
    const xKey = chart.x_axis_key
    const yKeys = chart.y_axis_keys || []

    if (type === 'none' || !xKey || yKeys.length === 0) {
      return (
        <div className="flex items-center justify-center h-full text-muted-foreground text-xs italic">
          AI recommended no visualization for this query.
        </div>
      )
    }

    if (type === 'pie') {
      const pieKey = yKeys[0]
      return (
        <ResponsiveContainer width="100%" height="100%">
          <PieChart>
            <Pie
              data={data}
              cx="50%"
              cy="50%"
              labelLine={false}
              label={({ name, percent }) => `${name} (${(percent * 100).toFixed(0)}%)`}
              outerRadius={95}
              fill="#8884d8"
              dataKey={pieKey}
              nameKey={xKey}
            >
              {data.map((_entry: any, index: number) => (
                <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
              ))}
            </Pie>
            <Tooltip 
              contentStyle={{ background: '#0b0f19', borderColor: '#1e293b', borderRadius: '12px' }}
              itemStyle={{ color: '#fff' }}
            />
            <Legend verticalAlign="bottom" height={36} iconType="circle" />
          </PieChart>
        </ResponsiveContainer>
      )
    }

    if (type === 'line') {
      return (
        <ResponsiveContainer width="100%" height="100%">
          <LineChart data={data} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
            <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
            <XAxis dataKey={xKey} stroke="#64748b" fontSize={11} tickLine={false} />
            <YAxis stroke="#64748b" fontSize={11} tickLine={false} />
            <Tooltip 
              contentStyle={{ background: '#0b0f19', borderColor: '#1e293b', borderRadius: '12px' }}
              itemStyle={{ color: '#fff' }}
            />
            <Legend verticalAlign="top" height={36} iconType="circle" />
            {yKeys.map((key: string, idx: number) => (
              <Line 
                key={key} 
                type="monotone" 
                dataKey={key} 
                stroke={COLORS[idx % COLORS.length]} 
                strokeWidth={2.5}
                activeDot={{ r: 6 }} 
              />
            ))}
          </LineChart>
        </ResponsiveContainer>
      )
    }

    if (type === 'area') {
      return (
        <ResponsiveContainer width="100%" height="100%">
          <AreaChart data={data} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
            <defs>
              {yKeys.map((key: string, idx: number) => (
                <linearGradient key={`grad-${key}`} id={`grad-${key}`} x1="0" y1="0" x2="0" y2="1">
                  <stop offset="5%" stopColor={COLORS[idx % COLORS.length]} stopOpacity={0.4}/>
                  <stop offset="95%" stopColor={COLORS[idx % COLORS.length]} stopOpacity={0.0}/>
                </linearGradient>
              ))}
            </defs>
            <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
            <XAxis dataKey={xKey} stroke="#64748b" fontSize={11} tickLine={false} />
            <YAxis stroke="#64748b" fontSize={11} tickLine={false} />
            <Tooltip 
              contentStyle={{ background: '#0b0f19', borderColor: '#1e293b', borderRadius: '12px' }}
              itemStyle={{ color: '#fff' }}
            />
            <Legend verticalAlign="top" height={36} iconType="circle" />
            {yKeys.map((key: string, idx: number) => (
              <Area 
                key={key} 
                type="monotone" 
                dataKey={key} 
                stroke={COLORS[idx % COLORS.length]} 
                fillOpacity={1}
                fill={`url(#grad-${key})`}
                strokeWidth={2}
              />
            ))}
          </AreaChart>
        </ResponsiveContainer>
      )
    }

    // Default to 'bar'
    return (
      <ResponsiveContainer width="100%" height="100%">
        <BarChart data={data} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
          <CartesianGrid strokeDasharray="3 3" stroke="rgba(255,255,255,0.05)" />
          <XAxis dataKey={xKey} stroke="#64748b" fontSize={11} tickLine={false} />
          <YAxis stroke="#64748b" fontSize={11} tickLine={false} />
          <Tooltip 
            contentStyle={{ background: '#0b0f19', borderColor: '#1e293b', borderRadius: '12px' }}
            itemStyle={{ color: '#fff' }}
          />
          <Legend verticalAlign="top" height={36} iconType="circle" />
          {yKeys.map((key: string, idx: number) => (
            <Bar 
              key={key} 
              dataKey={key} 
              fill={COLORS[idx % COLORS.length]} 
              radius={[6, 6, 0, 0]}
              maxBarSize={50}
            />
          ))}
        </BarChart>
      </ResponsiveContainer>
    )
  }

  return (
    <div className="flex-1 flex flex-col space-y-6 overflow-y-auto pr-2">
      {/* Title */}
      <div>
        <h2 className="font-display font-bold text-3xl text-white">AI Intelligence & Analytics</h2>
        <p className="text-muted-foreground text-sm">Ask analytical questions. Gemini will generate custom SQL queries, synthesize findings, calculate stats, and construct charts.</p>
      </div>

      {/* Query Search Card */}
      <div className="glass-card p-6 rounded-2xl border border-border">
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="relative">
            <span className="absolute inset-y-0 left-0 pl-4 flex items-center text-muted-foreground pointer-events-none">
              <SearchIcon size={18} />
            </span>
            <input
              type="text"
              value={analyticsQuery}
              onChange={(e) => setAnalyticsQuery(e.target.value)}
              placeholder="Ask an analytical question: 'Which districts are most polluted?'"
              className="w-full pl-11 pr-24 py-3.5 rounded-xl bg-black/40 border border-border text-sm text-foreground focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition-all placeholder:text-muted-foreground/60"
            />
            <button
              type="submit"
              disabled={analyticsLoading || !analyticsQuery.trim()}
              className="absolute right-2 top-2 flex items-center gap-1.5 bg-primary hover:bg-primary/95 text-primary-foreground text-xs font-semibold px-4 py-2 rounded-lg transition-all disabled:opacity-50"
            >
              {analyticsLoading ? (
                <>
                  <Loader2 size={12} className="animate-spin" /> Analyzing...
                </>
              ) : (
                <>
                  <Sparkles size={12} className="text-yellow-300 fill-yellow-300" /> Generate Insights
                </>
              )}
            </button>
          </div>

          {/* Preset Buttons */}
          <div className="flex flex-wrap gap-2 items-center">
            <span className="text-[10px] text-muted-foreground uppercase font-semibold tracking-wider">Examples:</span>
            {exampleAnalyticsQueries.map((q, i) => (
              <button
                key={i}
                type="button"
                onClick={() => handleExampleClick(q)}
                className="bg-white/5 hover:bg-white/10 text-muted-foreground hover:text-white border border-border px-2.5 py-1 rounded-lg text-xs transition-all"
              >
                {q}
              </button>
            ))}
          </div>
        </form>
      </div>

      {/* Error message */}
      {analyticsError && (
        <div className="p-4 bg-rose-500/10 border border-rose-500/20 rounded-xl flex items-start gap-3 text-sm text-rose-400">
          <AlertCircle size={18} className="shrink-0 mt-0.5" />
          <div>
            <p className="font-semibold">Insights Generation Failed</p>
            <p className="text-xs text-muted-foreground mt-0.5">{analyticsError}</p>
          </div>
        </div>
      )}

      {/* Analytics Result Suite */}
      {analyticsLoading && (
        <div className="flex-1 flex flex-col items-center justify-center py-20 gap-3">
          <Loader2 size={40} className="animate-spin text-primary" />
          <p className="text-sm text-muted-foreground">Running SQL extraction & synthesizing insights...</p>
        </div>
      )}

      {analyticsResult && !analyticsLoading && (
        <div className="space-y-6 animate-fade-in">
          {/* Key Metrics Row */}
          {analyticsResult.metrics && analyticsResult.metrics.length > 0 && (
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
              {analyticsResult.metrics.map((m: any, i: number) => (
                <div key={i} className="glass-card p-5 rounded-xl border border-border">
                  <p className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground mb-1">{m.label}</p>
                  <p className="font-display font-extrabold text-2xl text-white">{m.value}</p>
                </div>
              ))}
            </div>
          )}

          {/* Insights Grid */}
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            {/* Left Column: Summary & Insights List */}
            <div className="lg:col-span-1 flex flex-col gap-6">
              {/* Executive Summary */}
              <div className="glass-card p-6 rounded-2xl border border-border bg-black/10">
                <div className="flex items-center gap-2 mb-3 text-primary">
                  <Sparkles size={16} />
                  <h4 className="font-display font-bold text-sm uppercase tracking-wider text-white">Executive Summary</h4>
                </div>
                <p className="text-xs text-muted-foreground leading-relaxed whitespace-pre-wrap">
                  {analyticsResult.summary}
                </p>
              </div>

              {/* Specific Observations */}
              {analyticsResult.insights && analyticsResult.insights.length > 0 && (
                <div className="glass-card p-6 rounded-2xl border border-border">
                  <div className="flex items-center gap-2 mb-3 text-violet-400">
                    <TrendingUp size={16} />
                    <h4 className="font-display font-bold text-sm uppercase tracking-wider text-white">Key Observations</h4>
                  </div>
                  <ul className="space-y-2.5">
                    {analyticsResult.insights.map((ins: string, idx: number) => (
                      <li key={idx} className="flex gap-2 text-xs leading-relaxed text-muted-foreground">
                        <span className="font-bold text-primary font-mono select-none">{idx + 1}.</span>
                        <span>{ins}</span>
                      </li>
                    ))}
                  </ul>
                </div>
              )}
            </div>

            {/* Right Column: Visualization Chart */}
            <div className="lg:col-span-2 glass-card p-6 rounded-2xl border border-border flex flex-col h-[450px]">
              <div className="flex items-center justify-between pb-3 border-b border-border mb-6">
                <span className="text-xs font-bold uppercase tracking-wider text-white flex items-center gap-2">
                  <BarChart3 size={14} className="text-primary" /> 
                  <span>{analyticsResult.chart?.title || 'Data Visualization'}</span>
                </span>
                <span className="bg-slate-900 border border-border px-2.5 py-0.5 rounded font-mono text-[9px] text-muted-foreground font-semibold uppercase tracking-wider">
                  Type: {analyticsResult.chart?.chart_type || 'none'}
                </span>
              </div>
              <div className="flex-1 min-h-0">
                {renderChart()}
              </div>
            </div>
          </div>
          
          {/* SQL Query Audit */}
          <div className="glass-card p-5 rounded-2xl border border-border/80">
            <h4 className="text-xs font-bold uppercase tracking-wider text-muted-foreground mb-2">Executed Database Query</h4>
            <div className="bg-slate-950/80 p-4 rounded-xl border border-border font-mono text-[11px] text-emerald-400 overflow-x-auto whitespace-pre">
              <code>{analyticsResult.sql}</code>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
