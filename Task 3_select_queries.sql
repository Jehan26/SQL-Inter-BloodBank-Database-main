-- Task 3: Extracting Data from Blood Bank Database

-- 1. Select all donors
SELECT * FROM Donors;

-- 2. Get donors who are under 30
SELECT Name, Age, Gender FROM Donors
WHERE Age < 30;

-- 3. List all female receivers sorted by age descending
SELECT Name, Age, Gender FROM Receivers
WHERE Gender = 'Female'
ORDER BY Age DESC;

-- 4. Show top 5 most recent blood donations
SELECT d.ID, d.Name AS DonorName, bd.Date, bd.Quantity
FROM BloodDonations bd
JOIN Donors d ON bd.DonorID = d.ID
ORDER BY bd.Date DESC
LIMIT 5;

-- 5. Get all requests of blood type 'A+'
SELECT r.Name AS ReceiverName, bt.Type AS BloodType, br.Quantity, br.Date
FROM BloodRequests br
JOIN Receivers r ON br.ReceiverID = r.ID
JOIN BloodTypes bt ON r.BloodTypeID = bt.ID
WHERE bt.Type = 'A+';

-- 6. List staff members and the number of donations they handled (if any)
SELECT s.Name AS StaffName, COUNT(bd.ID) AS TotalDonations
FROM Staff s
LEFT JOIN BloodDonations bd ON s.ID = bd.StaffID
GROUP BY s.ID
ORDER BY TotalDonations DESC;
