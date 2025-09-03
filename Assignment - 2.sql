
-- 1] CREATE A TABLE STUDENT

create table Student
(StudentID INT PRIMARY KEY IDENTITY(1,1),
First_name VARCHAR(50) NOT NULL,
Last_name VARCHAR(50) NOT NULL,
DOB DATE NOT NULL,
GENDER CHAR(1) CHECK(GENDER IN ('M','F')),
MARKS INT CHECK(MARKS BETWEEN 0 AND 100),
ADMISSIONDATE DATETIME DEFAULT GETDATE());

---------------------------------------------------------------------------------------------

-- 2] INSERTING RECORDS

INSERT INTO Student (First_name,Last_name,DOB,GENDER,MARKS,ADMISSIONDATE)
VALUES ('John','Doe','2005-08-29','M',75,'2015-09-03 10:31:00'),
('Keerthy', 'Suresh','1992-06-23','F',80,'2015-09-03 10:32:00'),
('Neymar','Jr','1993-05-05','M',99,'2025-09-03 10:34:00'),
('Shifas','S','2004-05-12','M',85,'2015-09-03 10:33:00'),
('Heera','Y','2005-03-15','F',95,'2015-09-03 10:35:00'),
('Dhill','Israth','2001-12-12','F',100,'2015-09-03 10:36:00'),
('Preeth','RK','2001-08-29','M',100,GETDATE());

---------------------------------------------------------------------------------------------

-- 3] CREATE A BACKUP TABLE

SELECT * INTO STUDENT_BACKUP FROM STUDENT;
SELECT * FROM STUDENT_BACKUP

---------------------------------------------------------------------------------------------

-- 4] APPLY DATA FUNCTION

-- 1) DISPLAY STUDENTS AGE IN YEARS USING DOB

SELECT 
    First_name,
    Last_name,
    DOB,
    DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM Student;

-- 2) EXTRACT YEAR AND MONTH ADMISSIONDATE

SELECT 
    First_name,
    Last_name,
    YEAR(ADMISSIONDATE) AS AdmissionYear,
    MONTH(ADMISSIONDATE) AS AdmissionMonth
FROM Student;

-- 3) DISPLAY STUDENT ADMITTED IN THE LAST 30 DAYS

SELECT *
FROM Student
WHERE ADMISSIONDATE >= DATEADD(DAY, -30, GETDATE());

---------------------------------------------------------------------------------------------

-- 5] APPLY AGGREGATE FUNCTIONS

-- Write Queries for :
-- 1) Find the highest , lowest and average marks

SELECT MAX(MARKS) AS HIGHEST_MARK,
       MIN(MARKS) AS MINIMUM_MARK,
       AVG(MARKS) AS AVERAGE_MARK
FROM Student

-- 2) Count the total number of male and female students

SELECT 
    GENDER, 
    COUNT(*) AS TotalStudents
FROM Student
GROUP BY GENDER;

-- 3) Find the number of students born after 2000.

SELECT COUNT(*) AS studentbornafter2000
from Student
where DOB > '2000-12-31';

---------------------------------------------------------------------------------------------