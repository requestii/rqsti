from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from sqlalchemy import select

from app.db.session import get_db
from app.models.models import User, Wallet, Job
from app.schemas.schemas import RegisterIn, LoginIn, TokenOut, JobCreate, JobOut
from app.core.security import hash_password, verify_password, create_access_token

router = APIRouter()


@router.post("/auth/register", response_model=TokenOut, status_code=status.HTTP_201_CREATED)
def register(payload: RegisterIn, db: Session = Depends(get_db)):
    if db.scalar(select(User).where(User.email == payload.email)):
        raise HTTPException(status_code=400, detail="Email already exists")

    user = User(email=payload.email, password_hash=hash_password(payload.password), role=payload.role)
    db.add(user)
    db.flush()
    db.add(Wallet(user_id=user.id, balance=0))
    db.commit()
    return TokenOut(access_token=create_access_token(str(user.id)))


@router.post("/auth/login", response_model=TokenOut)
def login(payload: LoginIn, db: Session = Depends(get_db)):
    user = db.scalar(select(User).where(User.email == payload.email))
    if not user or not verify_password(payload.password, user.password_hash):
        raise HTTPException(status_code=401, detail="Invalid credentials")
    return TokenOut(access_token=create_access_token(str(user.id)))


@router.post("/users/{client_id}/jobs", response_model=JobOut, status_code=status.HTTP_201_CREATED)
def create_job(client_id: int, payload: JobCreate, db: Session = Depends(get_db)):
    client = db.get(User, client_id)
    if not client:
        raise HTTPException(status_code=404, detail="Client not found")
    if client.role != "client":
        raise HTTPException(status_code=403, detail="Only clients can post jobs")
    if payload.budget_max < payload.budget_min:
        raise HTTPException(status_code=422, detail="budget_max must be >= budget_min")

    job = Job(client_id=client_id, **payload.model_dump())
    db.add(job)
    db.commit()
    db.refresh(job)
    return JobOut(id=job.id, client_id=job.client_id, status=job.status, **payload.model_dump())


@router.get("/health")
def health():
    return {"status": "ok"}
