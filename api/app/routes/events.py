# Event-related routes placeholder
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.db.connection import get_db
from app.services.event_service import get_events, create_event

router = APIRouter(prefix="/events", tags=["events"])


@router.get("/")
def list_events(db: Session = Depends(get_db)):
    return get_events(db)


@router.post("/")
def add_event(name: str, location: str, db: Session = Depends(get_db)):
    return create_event(db, name, location)