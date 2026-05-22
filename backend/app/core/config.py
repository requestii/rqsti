from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    app_name: str = "Requestii API"
    secret_key: str = "change-me"
    algorithm: str = "HS256"
    access_token_minutes: int = 60
    database_url: str = "sqlite+pysqlite:///./requestii.db"

    model_config = SettingsConfigDict(env_file=".env", extra="ignore")


settings = Settings()
