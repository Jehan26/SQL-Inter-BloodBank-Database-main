-- Task 2: Insert, Update, and Delete Data

-- -----------------------------------------------------
-- INSERT DATA
-- -----------------------------------------------------

-- Blood Types
INSERT INTO BloodTypes (Type) VALUES 
('A+'), ('A-'), ('B+'), ('B-'), ('AB+'), ('AB-'), ('O+'), ('O-');

-- Staff
INSERT INTO Staff (Name, Role, Contact) VALUES
('Dr. Anjali Mehta', 'Technician', '999-123-4567'),
('Dr. Ravi Kapoor', 'Nurse', '999-987-6543');

-- Donors
INSERT INTO Donors (Name, Age, Gender, BloodTypeID) VALUES
('Rohit Sharma', 28, 'Male', 1),
('Priya Desai', 24, 'Female', 4),
('Karan Patel', 32, 'Male', 8);

-- Receivers
INSERT INTO Receivers (Name, Age, Gender, BloodTypeID) VALUES
('Meena Joshi', 50, 'Female', 1),
('Amit Verma', 45, 'Male', 3);

-- Blood Donations
INSERT INTO BloodDonations (DonorID, Date, Quantity, StaffID) VALUES
(1, '2025-06-01', 450, 1),
(2, '2025-06-02', 500, 2),
(3, '2025-06-05', 480, 1);

-- Blood Requests
INSERT INTO BloodRequests (ReceiverID, Date, Quantity, StaffID) VALUES
(1, '2025-06-10', 450, 2),
(2, '2025-06-12', 500, 1);

-- -----------------------------------------------------
-- UPDATE DATA
-- -----------------------------------------------------

-- Update donor's name and age
UPDATE Donors
SET Name = 'Rohit S.', Age = 29
WHERE ID = 1;

-- Update receiver blood type
UPDATE Receivers
SET BloodTypeID = 4
WHERE ID = 2;

-- Update staff contact info
UPDATE Staff
SET Contact = '999-000-1111'
WHERE Name = 'Dr. Anjali Mehta';

-- -----------------------------------------------------
-- DELETE DATA
-- -----------------------------------------------------

-- Delete a donation record
DELETE FROM BloodDonations
WHERE ID = 2;

-- Delete a receiver
DELETE FROM Receivers
WHERE ID = 1;

-- Delete a donor with no donations
DELETE FROM Donors
WHERE ID = 4; -- Only if no foreign key constraint blocks it
