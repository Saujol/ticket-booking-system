-- V2__add_indexes.sql

-- Lookup bookings by user
CREATE INDEX IX_Bookings_UserId
ON Bookings(UserId);

-- Lookup bookings by event
CREATE INDEX IX_Bookings_EventId
ON Bookings(EventId);

-- Event search by date
CREATE INDEX IX_Events_EventDate
ON Events(EventDate);