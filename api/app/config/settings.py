# Configuration settings placeholder
from pydantic import BaseSettings


class Settings(BaseSettings):
    DB_SERVER: str
    DB_DATABASE: str
    DB_USERNAME: str
    DB_PASSWORD: str

    class Config:
        env_file = ".env"


settings = Settings()