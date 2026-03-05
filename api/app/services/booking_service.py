# Booking service logic placeholder
def book_ticket(db, user_id, event_id):
    db.execute(
        "EXEC book_ticket :user_id, :event_id",
        {"user_id": user_id, "event_id": event_id}
    )
    db.commit()


#API
#  ↓
#@Booking Service
# ↓
#Stored Procedure
#  ↓
#SQL Transaction