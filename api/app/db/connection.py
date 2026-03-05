from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from app.config.settings import settings

connection_string = (
    f"mssql+pyodbc://{settings.DB_USERNAME}:{settings.DB_PASSWORD}"
    f"@{settings.DB_SERVER}/{settings.DB_DATABASE}"
    "?driver=ODBC+Driver+17+for+SQL+Server"
)

engine = create_engine(connection_string)

SessionLocal = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=engine
)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()