-- Migration: booking procedure
-- V3__booking_transaction_procedure.sql

CREATE PROCEDURE CreateBooking
    @UserId INT,
    @EventId INT,
    @Quantity INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    DECLARE @AvailableTickets INT;
    DECLARE @Price DECIMAL(10,2);

    SELECT 
        @AvailableTickets = AvailableTickets,
        @Price = Price
    FROM Events
    WHERE Id = @EventId;

    IF @AvailableTickets < @Quantity
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50001, 'Not enough tickets available', 1;
    END

    UPDATE Events
    SET AvailableTickets = AvailableTickets - @Quantity
    WHERE Id = @EventId;

    INSERT INTO Bookings (UserId, EventId, Quantity, TotalPrice)
    VALUES (@UserId, @EventId, @Quantity, @Price * @Quantity);

    COMMIT TRANSACTION;
END