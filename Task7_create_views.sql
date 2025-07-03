-- Task 7: Creating Views
-- Objective: Create and use views in Blood Bank Management System

-- -----------------------------------------------------
-- 1. View: DonorDetails – Donor name, blood type, total donated
-- -----------------------------------------------------
CREATE VIEW DonorDetails AS
SELECT 
    d.Name AS Donor_Name,
    bt.Type AS Blood_Type,
    SUM(bd.Quantity) AS Total_Donated
FROM 
    Donors d
JOIN BloodTypes bt ON d.BloodTypeID = bt.ID
LEFT JOIN BloodDonations bd ON d.ID = bd.DonorID
GROUP BY d.ID;

-- Usage:
SELECT * FROM DonorDetails;

-- -----------------------------------------------------
-- 2. View: ReceiverRequests – Receiver name, blood type, total requested
-- -----------------------------------------------------
CREATE VIEW ReceiverRequests AS
SELECT 
    r.Name AS Receiver_Name,
    bt.Type AS Blood_Type,
    SUM(br.Quantity) AS Total_Requested
FROM 
    Receivers r
JOIN BloodTypes bt ON r.BloodTypeID = bt.ID
LEFT JOIN BloodRequests br ON r.ID = br.ReceiverID
GROUP BY r.ID;

-- Usage:
SELECT * FROM ReceiverRequests;

-- -----------------------------------------------------
-- 3. View: StaffPerformance – Staff name, donations handled, requests handled
-- -----------------------------------------------------
CREATE VIEW StaffPerformance AS
SELECT 
    s.Name AS Staff_Name,
    (SELECT COUNT(*) FROM BloodDonations bd WHERE bd.StaffID = s.ID) AS Donations_Handled,
    (SELECT COUNT(*) FROM BloodRequests br WHERE br.StaffID = s.ID) AS Requests_Handled
FROM 
    Staff s;

-- Usage:
SELECT * FROM StaffPerformance;

-- -----------------------------------------------------
-- 4. View: BloodInventorySummary – Blood type and total available from donations
-- -----------------------------------------------------
CREATE VIEW BloodInventorySummary AS
SELECT 
    bt.Type AS Blood_Type,
    SUM(bd.Quantity) AS Total_Quantity
FROM 
    BloodDonations bd
JOIN Donors d ON bd.DonorID = d.ID
JOIN BloodTypes bt ON d.BloodTypeID = bt.ID
GROUP BY bt.ID;

-- Usage:
SELECT * FROM BloodInventorySummary;

-- -----------------------------------------------------
-- 5. View: ActiveDonors – Donors who have made at least 1 donation
-- -----------------------------------------------------
CREATE VIEW ActiveDonors AS
SELECT DISTINCT 
    d.ID,
    d.Name,
    bt.Type AS Blood_Type
FROM 
    Donors d
JOIN BloodTypes bt ON d.BloodTypeID = bt.ID
JOIN BloodDonations bd ON bd.DonorID = d.ID;

-- Usage:
SELECT * FROM ActiveDonors;
