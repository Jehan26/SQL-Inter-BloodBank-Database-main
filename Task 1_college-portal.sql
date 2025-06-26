1. create for Department:
CREATE TABLE Department (
    DeptID INTEGER PRIMARY KEY,
    DeptName TEXT NOT NULL
);

2. Create for Student:
CREATE TABLE Student (
    StudentID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT UNIQUE,
    DeptID INTEGER,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

3. Create for Faculty:
CREATE TABLE Faculty (
    FacultyID INTEGER PRIMARY KEY,
    Name TEXT NOT NULL,
    Email TEXT UNIQUE,
    DeptID INTEGER,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
4. Create for Course:
CREATE TABLE Course (
    CourseID INTEGER PRIMARY KEY,
    CourseName TEXT NOT NULL,
    Credits INTEGER,
    FacultyID INTEGER,
    DeptID INTEGER,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

5. Create for Enrollment:
CREATE TABLE Enrollment (
    StudentID INTEGER,
    CourseID INTEGER,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

