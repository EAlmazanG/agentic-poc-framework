from functools import lru_cache
from pathlib import Path

from pydantic import Field, field_validator
from pydantic_settings import BaseSettings, SettingsConfigDict

ROOT_DIR = Path(__file__).resolve().parents[4]
ENV_FILE = ROOT_DIR / ".env"


class Settings(BaseSettings):
    project_name: str = Field(default="agentic-poc-framework")
    app_env: str = Field(default="development")
    api_host: str = Field(default="0.0.0.0")
    api_port: int = Field(default=8000)
    api_reload: bool = Field(default=True)
    database_url: str = Field(
        default="postgresql+psycopg://postgres:postgres@db:5432/agentic_poc_framework"
    )
    api_cors_origins: list[str] = Field(
        default_factory=lambda: ["http://localhost:3000", "http://localhost:3001"]
    )
    trusted_hosts: list[str] = Field(
        default_factory=lambda: ["localhost", "127.0.0.1", "api", "web", "testserver"]
    )

    model_config = SettingsConfigDict(env_file=ENV_FILE, extra="ignore")

    @field_validator("api_cors_origins", mode="before")
    @classmethod
    def parse_cors_origins(cls, value: object) -> object:
        if isinstance(value, str):
            return [origin.strip() for origin in value.split(",") if origin.strip()]
        return value

    @field_validator("trusted_hosts", mode="before")
    @classmethod
    def parse_trusted_hosts(cls, value: object) -> object:
        if isinstance(value, str):
            return [host.strip() for host in value.split(",") if host.strip()]
        return value


@lru_cache
def get_settings() -> Settings:
    return Settings()
