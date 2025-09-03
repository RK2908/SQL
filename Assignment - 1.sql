-- 1] CREATING TABLES -- 

-- 1) Creating Departments Table

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE
);

-- 2) creating Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 17),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- 3)Creating Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

---------------------------------------------------------------------------------------------------

-- 2] INSERTING RECORDS --

-- 1) Inserting records in table Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Science'),
(2, 'Mechanical'),
(3, 'Electrical'),
(4, 'Civil'),
(5, 'Electronics');

-- 2) Inserting records in table Students
INSERT INTO Students (StudentID, Name, Age, DepartmentID) VALUES
(101, 'Messi', 36, 1),
(102, 'Ronaldo', 38, 5),
(103, 'Neymar', 34, 2),
(104, 'Sergio Ramous', 38, 1),
(105, 'Lamin yemal', 18, 3);

-- 3)Inserting records in table Courses
INSERT INTO Courses (CourseID, CourseName, DepartmentID) VALUES
(201, 'DBMS', 1),
(202, 'Thermodynamics', 2),
(203, 'Circuits', 3),
(204, 'Structures', 4),
(205, 'Artificial Intelligence', 1),
(206, 'Microprocessors', 5);

---------------------------------------------------------------------------------------------------

-- 3] APPLY WHERE AND OPERATORS --

-- 1) Display all students whose age is greater than 20
SELECT * FROM Students
WHERE Age > 20;

-- 2) Display all courses of the "Computer Science" department
SELECT C.CourseName 
FROM Courses C
JOIN Departments D ON C.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Computer Science';

-- 3) Display all students who belong to the "Electronics" department
SELECT S.Name, S.Age 
FROM Students S
JOIN Departments D ON S.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Electronics';

-- 4) Display students whose age is between 18 and 22
SELECT * FROM Students
WHERE Age BETWEEN 18 AND 22;

---------------------------------------------------------------------------------------------------

-- 4] JOINS -- 

-- 1) INNER JOIN Students with Departments (Show student names with their department names)
SELECT S.Name AS StudentName, D.DepartmentName
FROM Students S
INNER JOIN Departments D ON S.DepartmentID = D.DepartmentID;

-- 2) LEFT JOIN Courses with Departments (Show all courses even if some department does not exist)
SELECT C.CourseName, D.DepartmentName
FROM Courses C
LEFT JOIN Departments D ON C.DepartmentID = D.DepartmentID;

-- 3) RIGHT JOIN Students with Courses (Show all courses, even if no student has enrolled in them)
-- Note: Since we don’t have a Student-Course enrollment table.
-- we can assume a hypothetical relation. 
-- If not, RIGHT JOIN Students with Departments + Courses mapping.
SELECT S.Name AS StudentName, C.CourseName
FROM Students S
RIGHT JOIN Courses C ON S.DepartmentID = C.DepartmentID;

---------------------------------------------------------------------------------------------------


