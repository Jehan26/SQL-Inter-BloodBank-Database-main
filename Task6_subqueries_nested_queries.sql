-- Task 6: Subqueries and Nested Queries
-- Objective: Use subqueries in SELECT, WHERE, and FROM clauses

-- -------------------------------------------------------
-- 1. Subquery in SELECT: Show Donor and their total donated quantity
-- -------------------------------------------------------
SELECT 
    d.Name AS Donor_Name,
    (SELECT SUM(bd.Quantity) 
     FROM BloodDonations bd 
     WHERE bd.DonorID = d.ID) AS Total_Donated
FROM 
    Donors d;

-- -------------------------------------------------------
-- 2. Subquery in WHERE: Donors who donated more than 800ml in total
-- -------------------------------------------------------
SELECT 
    d.Name
FROM 
    Donors d
WHERE 
    (SELECT SUM(bd.Quantity)
     FROM BloodDonations bd
     WHERE bd.DonorID = d.ID) > 800;

-- -------------------------------------------------------
-- 3. Subquery in FROM: Average donation by each donor (nested in FROM)
-- -------------------------------------------------------
SELECT 
    Donor_Name,
    AVG(Quantity) AS Average_Donation
FROM (
    SELECT 
        d.Name AS Donor_Name,
        bd.Quantity
    FROM 
        Donors d
    JOIN BloodDonations bd ON d.ID = bd.DonorID
) AS DonorDonations
GROUP BY Donor_Name;

-- -------------------------------------------------------
-- 4. Subquery in SELECT: Staff with number of donations handled
-- -------------------------------------------------------
SELECT 
    s.Name AS Staff_Name,
    (SELECT COUNT(*) 
     FROM BloodDonations bd 
     WHERE bd.StaffID = s.ID) AS Donations_Handled
FROM 
    Staff s;

-- -------------------------------------------------------
-- 5. Subquery in WHERE: Receivers who requested more blood than the average
-- -------------------------------------------------------
SELECT 
    r.Name AS Receiver_Name
FROM 
    Receivers r
WHERE 
    (SELECT SUM(br.Quantity)
     FROM BloodRequests br
     WHERE br.ReceiverID = r.ID) >
    (SELECT AVG(Quantity) FROM BloodRequests);

-- -------------------------------------------------------
-- 6. Subquery in FROM: Total blood donated per blood type
-- -------------------------------------------------------
SELECT 
    Blood_Type,
    SUM(Quantity) AS Total_By_BloodType
FROM (
    SELECT 
        bt.Type AS Blood_Type,
        bd.Quantity
    FROM 
        BloodDonations bd
    JOIN Donors d ON bd.DonorID = d.ID
    JOIN BloodTypes bt ON d.BloodTypeID = bt.ID
) AS DonationsByType
GROUP BY Blood_Type;
