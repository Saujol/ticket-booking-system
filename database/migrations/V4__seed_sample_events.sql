-- Migration: seed events
-- V4__seed_sample_events.sql

INSERT INTO Events
(Title, Description, EventDate, TotalTickets, AvailableTickets, Price)
VALUES
('Rock Concert', 'Live rock music concert', '2026-06-15 19:00', 500, 500, 50.00),

('Tech Conference', 'Annual developer conference', '2026-07-10 09:00', 300, 300, 120.00),

('Football Match', 'Local league championship', '2026-05-20 18:00', 1000, 1000, 75.00);