1. Insert for Department:
INSERT INTO Department VALUES (1, 'Computer Science');
INSERT INTO Department VALUES (2, 'Electronics');
INSERT INTO Department VALUES (3, 'Mechanical');

2.  Insert for Student:
INSERT INTO Student VALUES (101, 'Keerthna SSM', 'keerthna@example.com', 1);
INSERT INTO Student VALUES (102, 'Arjun R', 'arjun@example.com', 2);
INSERT INTO Student VALUES (103, 'Meena S', 'meena@example.com', 1);

3. Insert for Faculty:
INSERT INTO Faculty VALUES (201, 'Dr. Ravi Kumar', 'ravi@college.edu', 1);
INSERT INTO Faculty VALUES (202, 'Dr. Priya S', 'priya@college.edu', 2);

4. Insert for Course:
INSERT INTO Course VALUES (301, 'Database Systems', 4, 201, 1);
INSERT INTO Course VALUES (302, 'Digital Electronics', 3, 202, 2);
INSERT INTO Course VALUES (303, 'Operating Systems', 4, 201, 1);

5. Insert for Enrollment:
INSERT INTO Enrollment VALUES (101, 301, '2025-06-20');
INSERT INTO Enrollment VALUES (101, 303, '2025-06-21');
INSERT INTO Enrollment VALUES (102, 302, '2025-06-22');
INSERT INTO Enrollment VALUES (103, 301, '2025-06-22');

INSERT INTO Department VALUES (4, NULL); 
INSERT INTO Student VALUES (104, 'Nisha K', NULL, 4);  
INSERT INTO Faculty VALUES (203, 'Dr. Naveen', NULL, 4);  

6.Update:
 UPDATE operations
Updating student email
UPDATE Student
SET Email = 'nisha.k@example.com'
WHERE StudentID = 104;

UPDATE Faculty
SET Email = 'unknown@college.edu'
WHERE Email IS NULL;

7. Delete:
DELETE operations
Delete student with missing email 
DELETE FROM Student
WHERE Email IS NULL;

Delete departments with NULL name
DELETE FROM Department
WHERE DeptName IS NULL;
