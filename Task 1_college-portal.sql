-- Task 1: Create Database Schema for Blood Bank Management System

-- Only needed for MySQL/PostgreSQL (SQLite auto-uses default DB)
-- CREATE DATABASE BloodBank;
-- USE BloodBank;

-- Drop tables if they exist (for re-execution during testing)
DROP TABLE IF EXISTS BloodRequests;
DROP TABLE IF EXISTS BloodDonations;
DROP TABLE IF EXISTS Receivers;
DROP TABLE IF EXISTS Donors;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS BloodTypes;

-- Table: BloodTypes
CREATE TABLE BloodTypes (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Type VARCHAR(5) NOT NULL UNIQUE
);

-- Table: Donors
CREATE TABLE Donors (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Age INTEGER CHECK (Age >= 18),
    Gender TEXT CHECK (Gender IN ('Male', 'Female', 'Other')),
    BloodTypeID INTEGER,
    FOREIGN KEY (BloodTypeID) REFERENCES BloodTypes(ID)
);

-- Table: Receivers
CREATE TABLE Receivers (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Age INTEGER CHECK (Age >= 0),
    Gender TEXT CHECK (Gender IN ('Male', 'Female', 'Other')),
    BloodTypeID INTEGER,
    FOREIGN KEY (BloodTypeID) REFERENCES BloodTypes(ID)
);

-- Table: Staff
CREATE TABLE Staff (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Role TEXT NOT NULL,
    Contact TEXT
);

-- Table: BloodDonations
CREATE TABLE BloodDonations (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    DonorID INTEGER NOT NULL,
    Date DATE NOT NULL,
    Quantity INTEGER NOT NULL CHECK (Quantity > 0),
    StaffID INTEGER,
    FOREIGN KEY (DonorID) REFERENCES Donors(ID),
    FOREIGN KEY (StaffID) REFERENCES Staff(ID)
);

-- Table: BloodRequests
CREATE TABLE BloodRequests (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ReceiverID INTEGER NOT NULL,
    Date DATE NOT NULL,
    Quantity INTEGER NOT NULL CHECK (Quantity > 0),
    StaffID INTEGER,
    FOREIGN KEY (ReceiverID) REFERENCES Receivers(ID),
    FOREIGN KEY (StaffID) REFERENCES Staff(ID)
);
