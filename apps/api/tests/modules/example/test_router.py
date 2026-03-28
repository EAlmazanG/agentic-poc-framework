from fastapi.testclient import TestClient

from app.main import create_app


def test_example_template_endpoint_returns_structure_example() -> None:
    client = TestClient(create_app())

    response = client.get("/api/v1/examples/template")

    assert response.status_code == 200
    assert response.json() == {
        "name": "example-module",
        "purpose": (
            "Demonstrates where routers, services, domain models, and infrastructure code belong."
        ),
    }
