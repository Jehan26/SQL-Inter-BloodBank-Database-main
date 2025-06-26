1. Select All Students:
SELECT * FROM Student;

2. Select Only Student Names and Emails:
SELECT Name, Email FROM Student;

3. Select Students from Computer Science Department (DeptID = 1):
SELECT * FROM Student WHERE DeptID = 1;

4. Use LIKE to Find Names Starting with "K":
SELECT * FROM Student WHERE Name LIKE 'K%';

 5. Use BETWEEN to Filter Enrollments by Date:
SELECT * FROM Enrollment
WHERE EnrollmentDate BETWEEN '2025-06-24' AND '2025-06-26';

6. Combine Conditions Using AND:
SELECT * FROM Course WHERE Credits > 3 AND DeptID = 1;

7. Use OR to Find Students from Dept 1 or Dept 3:
SELECT * FROM Student WHERE DeptID = 1 OR DeptID = 3;

8. Sort Students Alphabetically:
SELECT * FROM Student ORDER BY Name ASC;

9. Sort Faculty by Name in Descending Order:
SELECT * FROM Faculty ORDER BY Name DESC;

 10. Limit Output Rows:
SELECT * FROM Student LIMIT 2;

