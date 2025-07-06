-- Task 4: Aggregate Functions and Grouping
-- Objective: Use SUM, COUNT, AVG, GROUP BY on Blood Bank data

-- 1. Total blood donated (in ml)
SELECT 
    SUM(Quantity) AS Total_Blood_Donated
FROM 
    BloodDonations;

-- 2. Total blood requested (in ml)
SELECT 
    SUM(Quantity) AS Total_Blood_Requested
FROM 
    BloodRequests;

-- 3. Average donation quantity
SELECT 
    AVG(Quantity) AS Avg_Donation_Quantity
FROM 
    BloodDonations;

-- 4. Count of donations per donor
SELECT 
    d.Name AS Donor_Name,
    COUNT(bd.ID) AS Total_Donations
FROM 
    Donors d
LEFT JOIN 
    BloodDonations bd ON d.ID = bd.DonorID
GROUP BY 
    d.ID;

-- 5. Count of requests per receiver
SELECT 
    r.Name AS Receiver_Name,
    COUNT(br.ID) AS Total_Requests
FROM 
    Receivers r
LEFT JOIN 
    BloodRequests br ON r.ID = br.ReceiverID
GROUP BY 
    r.ID;

-- 6. Total blood donated by blood type
SELECT 
    bt.Type AS Blood_Type,
    SUM(bd.Quantity) AS Total_Donated
FROM 
    BloodDonations bd
JOIN 
    Donors d ON bd.DonorID = d.ID
JOIN 
    BloodTypes bt ON d.BloodTypeID = bt.ID
GROUP BY 
    bt.Type;

-- 7. Average quantity of blood requested by staff
SELECT 
    s.Name AS Staff_Name,
    AVG(br.Quantity) AS Avg_Requested_Quantity
FROM 
    BloodRequests br
JOIN 
    Staff s ON br.StaffID = s.ID
GROUP BY 
    s.Name;

-- 8. Number of donations handled by each staff
SELECT 
    s.Name AS Staff_Name,
    COUNT(bd.ID) AS Donations_Handled
FROM 
    Staff s
LEFT JOIN 
    BloodDonations bd ON s.ID = bd.StaffID
GROUP BY 
    s.ID;
