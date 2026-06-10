import os
from pydantic_settings import BaseSettings, SettingsConfigDict
from pydantic import Field

class Settings(BaseSettings):
    # MySQL settings
    MYSQL_HOST: str = Field(default="db")
    MYSQL_PORT: int = Field(default=3306)
    MYSQL_DATABASE: str = Field(default="data_intelligence_db")
    MYSQL_USER: str = Field(default="admin")
    MYSQL_PASSWORD: str = Field(default="admin_password")

    # Redis/Celery
    REDIS_URL: str = Field(default="redis://redis:6379/0")
    CELERY_BROKER_URL: str = Field(default="redis://redis:6379/0")
    CELERY_RESULT_BACKEND: str = Field(default="redis://redis:6379/0")

    # Gemini AI
    GEMINI_API_KEY: str = Field(default="")

    # Upload & Crawl Configurations
    UPLOAD_DIR: str = Field(default="/app/uploads")
    CRAWL_MAX_DEPTH: int = Field(default=2)
    CRAWL_MAX_PAGES: int = Field(default=15)

    @property
    def database_url(self) -> str:
        return f"mysql+pymysql://{self.MYSQL_USER}:{self.MYSQL_PASSWORD}@{self.MYSQL_HOST}:{self.MYSQL_PORT}/{self.MYSQL_DATABASE}"

    model_config = SettingsConfigDict(
        env_file="../.env",
        env_file_encoding="utf-8",
        extra="ignore"
    )

settings = Settings()

# Ensure directories exist
os.makedirs(settings.UPLOAD_DIR, exist_ok=True)
