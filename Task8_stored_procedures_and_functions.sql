-- Task 8: Stored Procedure and Function

-- Make sure you are using the correct database
-- USE BloodBank;

-- ------------------------------------------------------
-- 1. STORED PROCEDURE: GetDonationsByDonor
-- Description: Fetch donation history for a given donor ID
-- ------------------------------------------------------

DELIMITER $$

CREATE PROCEDURE GetDonationsByDonor(IN donor_id INT)
BEGIN
    SELECT 
        d.Name AS DonorName,
        bd.Date,
        bd.Quantity,
        s.Name AS HandledBy
    FROM BloodDonations bd
    JOIN Donors d ON bd.DonorID = d.ID
    LEFT JOIN Staff s ON bd.StaffID = s.ID
    WHERE d.ID = donor_id;
END $$

DELIMITER ;

-- To use:
-- CALL GetDonationsByDonor(1);


-- ------------------------------------------------------
-- 2. FUNCTION: TotalDonationAmount
-- Description: Return total quantity donated by a given donor
-- ------------------------------------------------------

DELIMITER $$

CREATE FUNCTION TotalDonationAmount(donor_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    
    SELECT SUM(Quantity)
    INTO total
    FROM BloodDonations
    WHERE DonorID = donor_id;

    RETURN IFNULL(total, 0);
END $$

DELIMITER ;

-- To use:
-- SELECT Name, TotalDonationAmount(ID) AS TotalDonated
-- FROM Donors;
