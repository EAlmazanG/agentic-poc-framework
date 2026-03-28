from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.core.settings import get_settings
from app.modules.example.api.router import router as example_router
from app.modules.health.router import router as health_router


def create_app() -> FastAPI:
    settings = get_settings()
    app = FastAPI(title=settings.project_name, version="0.1.0")

    app.add_middleware(
        CORSMiddleware,
        allow_origins=settings.api_cors_origins,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    app.include_router(health_router, prefix="/api/v1")
    app.include_router(example_router, prefix="/api/v1")

    @app.get("/")
    def root() -> dict[str, str]:
        return {"message": f"{settings.project_name} API", "environment": settings.app_env}

    return app


app = create_app()
