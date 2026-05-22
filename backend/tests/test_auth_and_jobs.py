from fastapi.testclient import TestClient
from app.main import app


def test_register_and_login_flow():
    client = TestClient(app)

    register = client.post(
        "/api/v1/auth/register",
        json={"email": "client@example.com", "password": "StrongPass123", "role": "client"},
    )
    assert register.status_code == 201
    assert "access_token" in register.json()

    login = client.post(
        "/api/v1/auth/login",
        json={"email": "client@example.com", "password": "StrongPass123"},
    )
    assert login.status_code == 200
    assert "access_token" in login.json()


def test_client_can_create_job():
    client = TestClient(app)

    register = client.post(
        "/api/v1/auth/register",
        json={"email": "poster@example.com", "password": "StrongPass123", "role": "client"},
    )
    assert register.status_code == 201

    response = client.post(
        "/api/v1/users/2/jobs",
        json={
            "title": "Need plumber in Dar",
            "description": "Fix leaking kitchen pipe this weekend.",
            "budget_min": 30,
            "budget_max": 50,
        },
    )
    assert response.status_code == 201
    assert response.json()["status"] == "open"
