import google.generativeai as genai
from app.config import settings

genai.configure(api_key=settings.GEMINI_API_KEY)
print("Using API Key:", settings.GEMINI_API_KEY[:10] + "..." if settings.GEMINI_API_KEY else "None")

try:
    for m in genai.list_models():
        print(m.name, m.supported_generation_methods)
except Exception as e:
    print("Error:", e)
