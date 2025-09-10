
------------------- MODULE : 1 --------------------
                   

-- Creating Database --
CREATE DATABASE August

-- Creating table --
CREATE TABLE Employee
(
  Employee_Id INT,
  First_Name CHAR(20),
  Last_Name CHAR(20),
  Salary INT,
  Address NVARCHAR(100)
 );


-- INSERTING RECORDS -- 

INSERT INTO Employee(Employee_Id,First_Name,Last_Name,Salary,Address)
VALUES(1,'Neymar','Jr',10000,'Brazil'),
(2,'Leonel','Messi',15000,'Argentina'),
(3,'Sergio','Ramous',20000,'Spain'),
(4,'Cristino','Ronaldo',25000,'Portugul');

INSERT INTO Employee
(Employee_Id,First_Name,Last_Name,Salary,Address)
SELECT 5,'Preeth','RK',30000,'India' UNION ALL
SELECT 6,'Luka','Modric',35000,'Croatia' UNION ALL
SELECT 7,'Kylian','Mbappe',40000,'Paris' UNION ALL
SELECT 8,'Jude','Bellingham',45000,'England'  


-- DISPLAYING TABLES --
SELECT * FROM Employee


------------------------------------------------------------------

-- CONSTRAINTS --

-- 1) NOT NULL :

CREATE TABLE NotNullTest
(
 Id INT NOT NULL,
 Name VARCHAR(100)
)

INSERT INTO NotNullTest(Id,Name)
SELECT 1,'Dinesh'

INSERT INTO NotNullTest(Id,Name)
SELECT NULL,'Neymar'

INSERT INTO NotNullTest(Id,Name)
SELECT 2,NULL

INSERT INTO NotNullTest(Id)
SELECT 3 

INSERT INTO NotNullTest(Name)
SELECT 'MESSI'

INSERT INTO NotNullTest(Id,Name)
SELECT 50,'RONALDO' UNION 
SELECT 51,'RAMOUS' UNION 
SELECT 52,'RONALDO' UNION 
SELECT 50,'RONALDO'

SELECT * FROM NotNullTest

------------------------------------------------------------------

-- 2) Unique :

CREATE TABLE UniqueTest
(
 Id int UNIQUE,
 Name VARCHAR(100)
)

INSERT INTO UniqueTest(Id,Name)
SELECT 1,'Messi'

INSERT INTO UniqueTest(Id,Name)
SELECT 2,'Neymar'

INSERT INTO UniqueTest(Id,Name)
SELECT NULL,'Messi'

INSERT INTO UniqueTest(Id,Name)
SELECT 4,NULL


SELECT * FROM UniqueTest
 
------------------------------------------------------------------

-- 3) PRIMARY KEY :

CREATE TABLE PrimaryKeyTest
(
 Id INT PRIMARY KEY,
 Name VARCHAR(100)
)

INSERT INTO PrimaryKeyTest(Id,Name)
SELECT 1,'Dinesh'

INSERT INTO PrimaryKeyTest(Id,Name)
SELECT 2,'John'

INSERT INTO PrimaryKeyTest(Id,Name)
SELECT 2,'Harry'

INSERT INTO PrimaryKeyTest(Id,Name)
SELECT 1,NULL 

SELECT * FROM PrimaryKeyTest

------------------------------------------------------------------

-- 4) FOREIGN KEY :

CREATE TABLE ForeignKeyTest
(
 Emp_Id INT 
 FOREIGN KEY (Emp_Id) REFERENCES PrimaryKeyTest(Id), -- Table_NAME(Column_Name)
 DOB DATE
)

INSERT INTO ForeignKeyTest(Id,DOB)
SELECT 1,'2003-08-29'

INSERT INTO ForeignKeyTest(Id,DOB)
SELECT NULL,'2004-08-29'

SELECT * FROM ForeignKeyTest


------------------------------------------------------------------

-- 5) CHECK :

CREATE TABLE CheckTest
(
 Id INT,
 Salary INT CHECK(Salary > 0)
)

INSERT INTO CheckTest(Id,Salary)
SELECT 1,1000

INSERT INTO CheckTest(Id,Salary)
SELECT 2,-20

SELECT * FROM CheckTest

--  OR ---

CREATE TABLE CheckTest2
(
 Name VARCHAR(100),
 Vaccination VARCHAR(10) CHECK(Vaccination IN ('Yes','No'))
)

INSERT INTO CheckTest2(Name,Vaccination)
SELECT 'Hari','Yes'

INSERT INTO CheckTest2(Name,Vaccination)
SELECT 'Preeth','No'

INSERT INTO CheckTest2(Name,Vaccination)
SELECT 'Neymar','Hi'

SELECT * FROM CheckTest2

------------------------------------------------------------------

-- 6) DEFAULT : 

CREATE TABLE DefaultTest
(
 Id INT,
 Name VARCHAR(100) DEFAULT('NoNameProvided')
)

INSERT INTO DefaultTest(Id,Name)
SELECT 1,'Ram'

INSERT INTO DefaultTest(Id)
SELECT 2

INSERT INTO DefaultTest(Id,Name)
SELECT 3,NULL

SELECT * FROM DefaultTest

------------------------------------------------------------------

-- 7) IDENTITY

CREATE TABLE IdentityTest
(
 Id INT IDENTITY(1,1),  -- (Seed,Increment) (1,1)-> 1,2,3,4,5..  | (0,2)-> 0,2,4,6,8..
 Name VARCHAR(100)
)

INSERT INTO IdentityTest(Id,Name)
SELECT 1,'Neymar'

INSERT INTO IdentityTest(Name)
SELECT 'Messi' UNION
SELECT 'Ronaldo'

SELECT * FROM IdentityTest
------------------------------------------------------------------

--> DAY : 7

CREATE TABLE Customer
(
 Customer_Id INT PRIMARY KEY,
 Customer_Name CHAR(100) NOT NULL,
 Email_Id NVARCHAR(30) UNIQUE,
 Age INT CHECK(Age>=18)
)

INSERT INTO Customer
VALUES(2015,'Ajith','aijth@gmail.com',20),
      (2016,'Hari','hari@gmail.com',21),
      (2017,'John','john@gmail.com',22)

SELECT * FROM Customer

------------------------------------------------------------------

-- FOREIGN KEY :

-- Table : 1

CREATE TABLE COLOUR
(
 Id INT PRIMARY KEY,
 Obj CHAR(10)
)

INSERT INTO COLOUR
VALUES(1,'APPLE'),
      (2,'CHERRY'),
      (3,'STRABERRY')

SELECT * FROM COLOUR
        
-- Table : 2

CREATE TABLE COLOURS
(
 ID INT,
 PRICES INT,
 FOREIGN KEY (ID) REFERENCES COLOUR(Id)
)

INSERT INTO COLOURS
VALUES(1,100),
      (2,200),
      (3,300)

SELECT * FROM COLOURS

------------------------------------------------------------------------

-- DATA RETRIEVAL PART :

SELECT PRICES  AS RATE FROM COLOURS
WHERE PRICES > 100

SELECT * FROM Employee
WHERE Employee_Id<>3

SELECT * FROM Employee
WHERE Employee_Id NOT IN (1,2,5)

-------------------------------------------------------------------------

-- LIKE OPERATOR :

SELECT * FROM Employee
WHERE First_Name LIKE '%h'

SELECT * FROM Employee
WHERE First_Name LIKE 'N%'

SELECT * FROM Employee
WHERE First_Name LIKE '%h%' 

SELECT * FROM Employee
WHERE First_Name LIKE '%N%'

SELECT * FROM Employee
WHERE First_Name LIKE '%n_'

SELECT * FROM Employee
WHERE First_Name LIKE '%i_'

-------------------------------------------------------------------------



 
 