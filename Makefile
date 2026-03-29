SHELL := /bin/sh

.PHONY: help doctor setup env-example hooks-install hooks-run api-sync web-sync docs-check quick-check \
	dev-up dev-down dev-logs dev-ps dev-restart \
	prod-up prod-down prod-logs prod-ps prod-rebuild \
	deploy-up deploy-down deploy-logs deploy-pull deploy-rebuild \
	compose-dev-config compose-prod-config compose-deploy-config \
	lint format typecheck test ci \
	api-lint api-format api-typecheck api-test api-shell api-migrate \
	web-lint web-format web-typecheck web-test web-shell \
	build build-api build-web build-prod db-shell db-reset logs clean

COMPOSE_BASE = docker compose --env-file .env -f infra/compose/compose.yaml
COMPOSE_DEV = $(COMPOSE_BASE) -f infra/compose/compose.dev.yaml
COMPOSE_PROD = $(COMPOSE_BASE) -f infra/compose/compose.prod.yaml
COMPOSE_DEPLOY = $(COMPOSE_BASE) -f infra/compose/compose.deploy.yaml

help:
	@echo "Agentic POC Framework"
	@echo ""
	@echo "Bootstrap"
	@echo "  make doctor             Verify required local tooling"
	@echo "  make setup              Prepare env, dependencies, and hooks"
	@echo "  make hooks-install      Install repository git hooks via pre-commit"
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
	@echo "  make docs-check        Verify documented root commands stay aligned"
	@echo "  make quick-check       Run the fast local guardrails"
	@echo "  make lint              Run API and web lint"
	@echo "  make typecheck         Run API and web type checks"
	@echo "  make test              Run API and web tests"
	@echo "  make ci                Run the full local validation flow"

doctor:
	@command -v uv >/dev/null 2>&1 || { echo "Missing required tool: uv"; exit 1; }
	@command -v node >/dev/null 2>&1 || { echo "Missing required tool: node"; exit 1; }
	@command -v npm >/dev/null 2>&1 || { echo "Missing required tool: npm"; exit 1; }
	@command -v docker >/dev/null 2>&1 || { echo "Missing required tool: docker"; exit 1; }
	@docker compose version >/dev/null 2>&1 || { echo "Missing required tool: docker compose"; exit 1; }
	@echo "All required tools are available."

env-example:
	@test -f .env || cp .env.example .env

api-sync:
	@cd apps/api && uv sync --extra dev

web-sync:
	@npm ci --prefix apps/web

hooks-install:
	@uv tool run --from pre-commit pre-commit install

hooks-run:
	@uv tool run --from pre-commit pre-commit run --all-files

setup: doctor env-example api-sync web-sync hooks-install
	@echo "Setup complete. Next steps: make dev-up"

docs-check:
	@python3 scripts/docs_check.py

quick-check: docs-check api-lint web-lint web-typecheck

dev-up: env-example
	@$(COMPOSE_DEV) up --build -d

dev-down:
	@$(COMPOSE_DEV) down

dev-logs:
	@$(COMPOSE_DEV) logs -f

dev-ps:
	@$(COMPOSE_DEV) ps

dev-restart: dev-down dev-up

prod-up: env-example
	@$(COMPOSE_PROD) up --build -d

prod-down:
	@$(COMPOSE_PROD) down

prod-logs:
	@$(COMPOSE_PROD) logs -f

prod-ps:
	@$(COMPOSE_PROD) ps

prod-rebuild:
	@$(COMPOSE_PROD) up --build -d

deploy-up: env-example
	@$(COMPOSE_DEPLOY) up -d

deploy-down:
	@$(COMPOSE_DEPLOY) down

deploy-logs:
	@$(COMPOSE_DEPLOY) logs -f

deploy-pull:
	@$(COMPOSE_DEPLOY) pull

deploy-rebuild:
	@$(COMPOSE_DEPLOY) up --build -d

compose-dev-config: env-example
	@$(COMPOSE_DEV) config

compose-prod-config: env-example
	@$(COMPOSE_PROD) config

compose-deploy-config: env-example
	@$(COMPOSE_DEPLOY) config

lint: api-lint web-lint

format: api-format web-format

typecheck: api-typecheck web-typecheck

test: api-test web-test

ci: docs-check lint typecheck test

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
	@$(COMPOSE_DEV) exec db /bin/sh -lc 'psql -U "$$POSTGRES_USER" -d "$$POSTGRES_DB"'

db-reset:
	@$(COMPOSE_DEV) down -v
	@$(COMPOSE_DEV) up -d db

logs:
	@$(COMPOSE_DEV) logs -f

clean:
	@find . -type d \( -name __pycache__ -o -name .pytest_cache -o -name .mypy_cache -o -name .ruff_cache -o -name .next \) -prune -exec rm -rf {} +
	@find . -type f \( -name '*.tsbuildinfo' -o -name '.coverage' \) -delete
