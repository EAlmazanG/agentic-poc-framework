from functools import lru_cache

from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    project_name: str = Field(default="agentic-poc-framework")
    app_env: str = Field(default="development")
    api_host: str = Field(default="0.0.0.0")
    api_port: int = Field(default=8000)
    api_reload: bool = Field(default=True)
    database_url: str = Field(default="postgresql+psycopg://postgres:postgres@db:5432/agentic_poc_framework")
    api_cors_origins: list[str] = Field(default_factory=lambda: ["http://localhost:3000", "http://localhost:3001"])

    model_config = SettingsConfigDict(extra="ignore")


@lru_cache
def get_settings() -> Settings:
    return Settings()
