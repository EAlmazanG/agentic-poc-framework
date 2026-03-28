from fastapi.testclient import TestClient

from app.main import create_app


def test_healthcheck_returns_ok() -> None:
    client = TestClient(create_app())

    response = client.get("/api/v1/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok", "service": "api"}


def test_security_headers_are_added() -> None:
    client = TestClient(create_app())

    response = client.get("/api/v1/health")

    assert response.headers["x-content-type-options"] == "nosniff"
    assert response.headers["x-frame-options"] == "DENY"
    assert response.headers["referrer-policy"] == "strict-origin-when-cross-origin"


def test_untrusted_host_is_rejected() -> None:
    client = TestClient(create_app())

    response = client.get("/api/v1/health", headers={"host": "malicious.example"})

    assert response.status_code == 400
