-- Task 5: SQL Joins (Inner, Left, Right, Full)
-- Objective: Learn to combine data from multiple tables
-- Schema: Blood Bank Management System

-- -----------------------------------------------------
-- 1. INNER JOIN: Donor Name, Blood Type, and Donation Date
-- -----------------------------------------------------
SELECT 
    d.Name AS Donor_Name,
    bt.Type AS Blood_Type,
    bd.Date AS Donation_Date
FROM 
    Donors d
INNER JOIN BloodTypes bt ON d.BloodTypeID = bt.ID
INNER JOIN BloodDonations bd ON d.ID = bd.DonorID;

-- -----------------------------------------------------
-- 2. LEFT JOIN: All Donors and their Donations (if any)
-- -----------------------------------------------------
SELECT 
    d.Name AS Donor_Name,
    bd.Date AS Donation_Date,
    bd.Quantity AS Donation_Quantity
FROM 
    Donors d
LEFT JOIN BloodDonations bd ON d.ID = bd.DonorID;

-- -----------------------------------------------------
-- 3. RIGHT JOIN (Simulated): All Donations and their Donors (if any)
-- -----------------------------------------------------
SELECT 
    d.Name AS Donor_Name,
    bd.Date AS Donation_Date,
    bd.Quantity
FROM 
    BloodDonations bd
LEFT JOIN Donors d ON d.ID = bd.DonorID;

-- -----------------------------------------------------
-- 4. FULL OUTER JOIN (Simulated): All Donors and Donations (matched or not)
-- -----------------------------------------------------
SELECT 
    d.Name AS Donor_Name,
    bd.Date AS Donation_Date,
    bd.Quantity
FROM 
    Donors d
LEFT JOIN BloodDonations bd ON d.ID = bd.DonorID

UNION

SELECT 
    d.Name AS Donor_Name,
    bd.Date AS Donation_Date,
    bd.Quantity
FROM 
    BloodDonations bd
LEFT JOIN Donors d ON d.ID = bd.DonorID;

-- -----------------------------------------------------
-- 5. INNER JOIN: Receivers with Their Blood Type
-- -----------------------------------------------------
SELECT 
    r.Name AS Receiver_Name,
    bt.Type AS Blood_Type
FROM 
    Receivers r
INNER JOIN BloodTypes bt ON r.BloodTypeID = bt.ID;

-- -----------------------------------------------------
-- 6. INNER JOIN: Donations with Staff who handled them
-- -----------------------------------------------------
SELECT 
    bd.ID AS Donation_ID,
    s.Name AS Staff_Name,
    bd.Quantity
FROM 
    BloodDonations bd
JOIN Staff s ON bd.StaffID = s.ID;

-- -----------------------------------------------------
-- 7. Multi-table JOIN: Requests handled by Staff for each Receiver
-- -----------------------------------------------------
SELECT 
    br.ID AS Request_ID,
    r.Name AS Receiver_Name,
    s.Name AS Staff_Name,
    br.Quantity
FROM 
    BloodRequests br
JOIN Staff s ON br.StaffID = s.ID
JOIN Receivers r ON br.ReceiverID = r.ID;
