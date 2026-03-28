FROM python:3.12-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_PROJECT_ENVIRONMENT=/usr/local

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential curl \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir uv

WORKDIR /workspace/apps/api

FROM base AS dev
COPY apps/api /workspace/apps/api
RUN uv sync --project /workspace/apps/api --extra dev
ENV PYTHONPATH=/workspace/apps/api/src
EXPOSE 8000
CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

FROM base AS runtime
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser
COPY apps/api /workspace/apps/api
RUN uv sync --project /workspace/apps/api \
    && chown -R appuser:appgroup /workspace/apps/api
USER appuser
ENV PYTHONPATH=/workspace/apps/api/src
EXPOSE 8000
CMD ["uv", "run", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
