-- Migration: create tables
-- V1__create_core_tables.sql
-- Core schema for Ticket Booking System

-- USERS TABLE
CREATE TABLE Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    PasswordHash NVARCHAR(500) NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),

    CONSTRAINT UQ_Users_Email UNIQUE (Email)
);


-- EVENTS TABLE
CREATE TABLE Events (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX),
    EventDate DATETIME2 NOT NULL,
    TotalTickets INT NOT NULL,
    AvailableTickets INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);


-- BOOKINGS TABLE
CREATE TABLE Bookings (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    EventId INT NOT NULL,
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    BookingTime DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),

    CONSTRAINT FK_Bookings_User
        FOREIGN KEY (UserId) REFERENCES Users(Id),

    CONSTRAINT FK_Bookings_Event
        FOREIGN KEY (EventId) REFERENCES Events(Id)
);