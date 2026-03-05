from fastapi import FastAPI

from app.routes import events
from app.routes import bookings
from app.routes import auth

app = FastAPI(title="Ticket Booking API")

app.include_router(events.router)
app.include_router(bookings.router)
app.include_router(auth.router)


@app.get("/")
def health():
    return {"status": "running"}