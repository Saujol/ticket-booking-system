# Architecture

High-level architectural overview for the Ticket Booking System.




# Database
1️⃣ Users Table
Important constraint: UQ_Users_Email
Prevents duplicate email registrations.

2️⃣ Events Table
Important columns:
TotalTickets
AvailableTickets

Why both?
Because booking logic will do:

check AvailableTickets
↓
deduct tickets
↓
create booking

3️⃣ Bookings Table
Stores ticket purchases.

Relationships:
User → Booking
Event → Booking

Foreign keys ensure data integrity.

🔗 Schema Relationship
Users
  │
  │ 1..*
  ▼
Bookings
  ▲
  │ *..1
Events
# Meaning:
User can make many bookings
Event can have many bookings

# Why add_indexes.sql
Common queries will be like:

Get all bookings of user
Get bookings for event
Find upcoming events

# Booking_procedure.sql
Start Transaction
      ↓
Check tickets
      ↓
Reduce available tickets
      ↓
Insert booking
      ↓
Commit
      ↓
If something fails
      ↓
Rollback