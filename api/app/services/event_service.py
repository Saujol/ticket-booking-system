# Event service logic placeholder
from sqlalchemy.orm import Session
from app.models.event import Event


def get_events(db: Session):
    return db.query(Event).all()


def create_event(db: Session, name: str, location: str):
    event = Event(name=name, location=location)
    db.add(event)
    db.commit()
    db.refresh(event)
    return event