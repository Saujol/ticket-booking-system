# Booking routes placeholder
from fastapi import APIRouter

router = APIRouter(prefix="/bookings", tags=["bookings"])


@router.get("/")
def list_bookings():
    return {"message": "List bookings"}