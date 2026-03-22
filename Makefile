.PHONY: help setup env-example \
	dev-up dev-down dev-logs dev-ps dev-restart \
	prod-up prod-down prod-logs prod-ps prod-rebuild \
	deploy-up deploy-down deploy-logs deploy-pull deploy-rebuild \
	lint format typecheck test ci \
	api-lint api-format api-typecheck api-test api-shell api-migrate \
	web-lint web-format web-typecheck web-test web-shell \
	build build-api build-web build-prod db-shell db-reset logs clean

COMPOSE_BASE = docker compose -f infra/compose/compose.yaml
COMPOSE_DEV = $(COMPOSE_BASE) -f infra/compose/compose.dev.yaml
COMPOSE_PROD = $(COMPOSE_BASE) -f infra/compose/compose.prod.yaml
COMPOSE_DEPLOY = $(COMPOSE_BASE) -f infra/compose/compose.deploy.yaml

help:
	@echo "Agentic POC Framework"
	@echo ""
	@echo "Setup"
	@echo "  make setup              Prepare local environment"
	@echo ""
	@echo "Development"
	@echo "  make dev-up             Start development stack"
	@echo "  make dev-down           Stop development stack"
	@echo "  make dev-logs           Follow development logs"
	@echo ""
	@echo "Prod-like"
	@echo "  make prod-up            Start prod-like local stack"
	@echo "  make prod-down          Stop prod-like local stack"
	@echo ""
	@echo "Deployment"
	@echo "  make deploy-up          Start deployment stack"
	@echo "  make deploy-down        Stop deployment stack"
	@echo ""
	@echo "Quality"
	@echo "  make lint              Run API and web lint"
	@echo "  make typecheck         Run API and web type checks"
	@echo "  make test              Run API and web tests"
	@echo "  make ci                Run core local CI parity"

env-example:
	@test -f .env || cp .env.example .env

setup: env-example
	@echo "Setting up API dependencies with uv..."
	@cd apps/api && uv sync
	@echo "Setting up web dependencies with npm..."
	@npm install --prefix apps/web
	@echo "Setup complete. Next steps: make dev-up"

dev-up:
	@$(COMPOSE_DEV) up --build -d

dev-down:
	@$(COMPOSE_DEV) down

dev-logs:
	@$(COMPOSE_DEV) logs -f

dev-ps:
	@$(COMPOSE_DEV) ps

dev-restart: dev-down dev-up

prod-up:
	@$(COMPOSE_PROD) up --build -d

prod-down:
	@$(COMPOSE_PROD) down

prod-logs:
	@$(COMPOSE_PROD) logs -f

prod-ps:
	@$(COMPOSE_PROD) ps

prod-rebuild:
	@$(COMPOSE_PROD) up --build -d

deploy-up:
	@$(COMPOSE_DEPLOY) up -d

deploy-down:
	@$(COMPOSE_DEPLOY) down

deploy-logs:
	@$(COMPOSE_DEPLOY) logs -f

deploy-pull:
	@$(COMPOSE_DEPLOY) pull

deploy-rebuild:
	@$(COMPOSE_DEPLOY) up --build -d

lint: api-lint web-lint

format: api-format web-format

typecheck: api-typecheck web-typecheck

test: api-test web-test

ci: lint typecheck test

api-lint:
	@cd apps/api && uv run ruff check src tests

api-format:
	@cd apps/api && uv run ruff format src tests

api-typecheck:
	@cd apps/api && uv run mypy src

api-test:
	@cd apps/api && uv run pytest tests

api-shell:
	@$(COMPOSE_DEV) exec api /bin/sh

api-migrate:
	@cd apps/api && uv run alembic upgrade head

web-lint:
	@npm run --prefix apps/web lint

web-format:
	@npm run --prefix apps/web format

web-typecheck:
	@npm run --prefix apps/web typecheck

web-test:
	@npm run --prefix apps/web test -- --runInBand

web-shell:
	@$(COMPOSE_DEV) exec web /bin/sh

build: build-api build-web

build-api:
	@$(COMPOSE_BASE) build api

build-web:
	@$(COMPOSE_BASE) build web

build-prod:
	@$(COMPOSE_PROD) build

db-shell:
	@$(COMPOSE_DEV) exec db psql -U $$POSTGRES_USER -d $$POSTGRES_DB

db-reset:
	@$(COMPOSE_DEV) down -v
	@$(COMPOSE_DEV) up -d db

logs:
	@$(COMPOSE_DEV) logs -f

clean:
	@find . -type d \( -name __pycache__ -o -name .pytest_cache -o -name .mypy_cache -o -name .ruff_cache -o -name .next \) -prune -exec rm -rf {} +
