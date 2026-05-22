from fastapi import FastAPI
from app.api.v1.routes import router
from app.db.session import Base, engine

Base.metadata.create_all(bind=engine)

app = FastAPI(title="Requestii API")
app.include_router(router, prefix="/api/v1")
