-- Branch Table
CREATE TABLE Branch (
    branchNo CHAR(4) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50),
    postcode CHAR(8)
);

INSERT INTO Branch (branchNo, street, city, postcode) VALUES 
('B005', '22 Deer Rd', 'London', 'SW1 4EH'),
('B007', '16 Argyll St', 'Aberdeen', 'AB2 3SU'),
('B003', '163 Main St', 'Glasgow', 'G11 9QX'),
('B004', '32 Manse Rd', 'Bristol', 'BS99 1NZ'),
('B002', '56 Clover Dr', 'London', 'NW10 6EU');

-- Staff Table
CREATE TABLE Staff (
    staffNo VARCHAR(5) PRIMARY KEY,
    fName VARCHAR(20),
    lName VARCHAR(20),
    position VARCHAR(20),
    sex CHAR(1) CHECK (sex IN ('M', 'F')),
    DOB DATE,
    salary INT,
    branchNo CHAR(4),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

INSERT INTO Staff (staffNo, fName, lName, position, sex, DOB, salary, branchNo) VALUES 
('SL21', 'John', 'White', 'Manager', 'M', '1945-10-01', 30000, 'B005'), 
('SG37', 'Ann', 'Beech', 'Assistant', 'F', '1960-11-10', 12000, 'B003'),
('SG14', 'David', 'Ford', 'Supervisor', 'M', '1958-03-24', 18000, 'B003'), 
('SA9', 'Mary', 'Howe', 'Assistant', 'F', '1970-02-19', 9000, 'B007'),
('SG5', 'Susan', 'Brand', 'Manager', 'F', '1940-06-03', 24000, 'B003'), 
('SL41', 'Julie', 'Lee', 'Assistant', 'F', '1965-06-13', 9000, 'B005');

-- Registration Table
CREATE TABLE Registration (
    clientNo VARCHAR(5),
    branchNo CHAR(4),
    staffNo VARCHAR(5),
    dateJoined DATE,
    PRIMARY KEY (clientNo, branchNo),
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo)
);

INSERT INTO Registration VALUES 
('CR76', 'B005', 'SL41', '2004-01-02'), 
('CR56', 'B003', 'SG37', '2003-04-11'), 
('CR74', 'B003', 'SG37', '2002-11-16'), 
('CR62', 'B007', 'SA9', '2003-03-07');

-- PropertyForRent Table
CREATE TABLE PropertyForRent (
    propertyNo VARCHAR(5) PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(20),
    postcode VARCHAR(10),
    type VARCHAR(10),
    rooms INT,
    rent DECIMAL(6, 2),
    ownerNo VARCHAR(5),
    staffNo VARCHAR(5),
    branchNo CHAR(4),
    FOREIGN KEY (staffNo) REFERENCES Staff(staffNo),
    FOREIGN KEY (branchNo) REFERENCES Branch(branchNo)
);

INSERT INTO PropertyForRent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo) VALUES
('PA14', '16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46', 'SA9', 'B007'),
('PL94', '6 Argyll St', 'London', 'NW2', 'Flat', 3, 400, 'CO87', 'SL41', 'B005'),
('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40', 'SG37', 'B003'),
('PG36', '2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO40', 'SG37', 'B003'),
('PG21', '18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87', 'SG37', 'B003'),
('PG16', '5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93', 'SG14', 'B003');

-- Client Table
CREATE TABLE Client (
    clientNo VARCHAR(5) PRIMARY KEY,
    fName VARCHAR(20),
    lName VARCHAR(20),
    telNo VARCHAR(15),
    prefType VARCHAR(10),
    maxRent DECIMAL(6, 2)
);

INSERT INTO Client (clientNo, fName, lName, telNo, prefType, maxRent) VALUES
('CR76', 'John', 'Kay', '0207-774-5632', 'Flat', 425),
('CR56', 'Aline', 'Stewart', '0141-848-1825', 'Flat', 350),
('CR74', 'Mike', 'Ritchie', '01475-392178', 'House', 750),
('CR62', 'Mary', 'Tregear', '01224-196720', 'Flat', 600);

-- PrivateOwner Table
CREATE TABLE PrivateOwner (
    ownerNo VARCHAR(5) PRIMARY KEY,
    fName VARCHAR(20),
    lName VARCHAR(20),
    address VARCHAR(50),
    telNo VARCHAR(15)
);

INSERT INTO PrivateOwner (ownerNo, fName, lName, address, telNo) VALUES
('CO46', 'Joe', 'Keogh', '2 Fergus Dr, Aberdeen AB2 7SX', '01224-861212'),
('CO87', 'Carol', 'Farrel', '6 Achray St, Glasgow G32 9DX', '0141-357-7419'),
('CO40', 'Tina', 'Murphy', '63 Well St, Glasgow G42', '0141-943-1728'),
('CO93', 'Tony', 'Shaw', '12 Park Pl, Glasgow G4 0QR', '0141-225-7025');

-- Viewing Table
CREATE TABLE Viewing (
    viewingID INT PRIMARY KEY AUTO_INCREMENT,
    clientNo VARCHAR(5),
    propertyNo VARCHAR(5),
    viewDate DATE,
    comment VARCHAR(50),
    FOREIGN KEY (clientNo) REFERENCES Client(clientNo),
    FOREIGN KEY (propertyNo) REFERENCES PropertyForRent(propertyNo)
);

INSERT INTO Viewing (clientNo, propertyNo, viewDate, comment) VALUES
('CR56', 'PA14', '2004-05-24', 'too small'),
('CR76', 'PG4', '2004-04-20', 'too remote'),
('CR56', 'PG4', '2004-05-26', NULL),
('CR62', 'PA14', '2004-05-14', 'no dining room'),
('CR56', 'PG36', '2004-04-28', NULL);







-- ALL ANSWERS------------------------

-- Day 1-------------------------------------------------------------

-- List full details of all staff.
-- 1.list full details of Staff
SELECT * FROM Staff;

-- 2.Produce a list of salaries for all staff, showing only the staff number, the first and last names, and the salary details.
SELECT staffNo, FName, LName, salary FROM staff;

-- 3.Produce a list of monthly salaries for all staff, showing the staff number, the first and last names, and the salary details.
SELECT StaffNo, FName, LName, salary / 12 AS monthly_salary FROM Staff;

-- 4.List all staff with a salary greater than £10,000.
SELECT * FROM Staff WHERE salary > 10000;

-- 5.List all staff with a salary between £20,000 and £30,000.
SELECT * FROM Staff WHERE salary BETWEEN 20000 AND 30000;

-- 6.Produce a list of salaries for all staff, showing only the staff number, name, and salary details.
SELECT StaffNo, CONCAT(fName, ' ', lName) AS Name, salary FROM Staff;

-- 7.List all managers and supervisors.
SELECT * FROM Staff WHERE position IN ('Manager', 'Supervisor');

-- 8.List all cities where there is either a branch office or a property for rent.
SELECT DISTINCT city FROM Branch
UNION
SELECT DISTINCT city FROM PropertyForRent;

-- 9.List all cities where there is a branch office but no properties for rent.
SELECT city FROM Branch
WHERE city NOT IN (SELECT city FROM PropertyForRent);

-- 10.List all cities where there is both a branch office and at least one property for rent.
SELECT city FROM Branch
WHERE city IN (SELECT city FROM PropertyForRent);

--Day 3 -----------------------------------------------------------------------------------------------

-- 11,List the names and comments of all clients who have viewed a property for rent.
SELECT Client.fName, Client.lName, Viewing.comment
FROM Viewing
JOIN Client ON Viewing.clientNo = Client.clientNo;

-- 12.Produce a status report on property Viewings.
SELECT propertyNo, COUNT(clientNo) AS num_viewings, COUNT(comment) AS num_comments
FROM Viewing
GROUP BY propertyNo;

-- 13.List complete details of all staff who work at the branch in Glasgow.
SELECT Staff.* FROM Staff
JOIN Branch ON Staff.branchNo = Branch.branchNo
WHERE Branch.city = 'Glasgow';

-- 14.Find all owners with the string 'Glasgow' in their address.
SELECT * FROM PrivateOwner WHERE address LIKE '%Glasgow%';

-- 15,How many properties cost more than £350 per month to rent?
SELECT COUNT(*) FROM PropertyForRent WHERE rent > 350;

-- 16.Find the minimum, maximum, and average staff salary.
SELECT MIN(salary) AS min_salary,
 MAX(salary) AS max_salary,
  AVG(salary) AS avg_salary FROM staff;
SELECT MIN(salary),MAX(salary),AVG(salary) FROM Staff;

-- 17.Find the number of staff working in each branch and the sum of their salaries.
SELECT branchNo, COUNT(staffNo) AS num_staff, SUM(salary) AS total_salary
FROM staff
GROUP BY branchNo;

-- 18.List the details of all viewings on property PG4 where a comment has not been supplied.
SELECT * FROM viewing WHERE propertyNo = 'PG4' AND comment IS NULL;

-- 19.Produce a list of salaries for all staff, arranged in descending order of salary.
SELECT staffNo, FName, LName, salary FROM staff ORDER BY salary DESC;

-- 20.Produce a list of properties arranged in order of property type.
SELECT * FROM property ORDER BY type;

-- Day 4 -----------------------------------------------------------------------------------------------

-- 21. How many different properties were viewed in May 2004?
SELECT COUNT(DISTINCT propertyNo) AS properties_viewed
FROM Viewing
WHERE MONTH(viewDate) = 5 AND YEAR(viewDate) = 2004;

-- 22. Find the total number of Managers and the sum of their salaries.
SELECT COUNT(*) AS num_managers, SUM(salary) AS total_salary FROM Staff
WHERE position = 'Manager';

-- 23. For each branch office with more than one member of staff, find the number of staff working in each branch and the sum of their salaries.
SELECT branchNo, COUNT(staffNo) AS num_staff, SUM(salary) AS total_salary FROM Staff
GROUP BY branchNo
HAVING COUNT(staffNo) > 1;

-- 24. List the staff who work in the branch at '163 Main St'.
SELECT Staff.* FROM Staff
JOIN Branch ON Staff.branchNo = Branch.branchNo
WHERE Branch.street = '163 Main St';

-- 25. List all staff whose salary is greater than the average salary, and show by how much their salary is greater than the average.
SELECT staffNo, fName, lName, salary, 
salary - (SELECT AVG(salary) FROM Staff) AS above_average FROM Staff
WHERE salary > (SELECT AVG(salary) FROM Staff);

-- 26. List the properties that are handled by staff who work in the branch at '163 Main St'.
SELECT PropertyForRent.* FROM PropertyForRent
JOIN Staff ON PropertyForRent.staffNo = Staff.staffNo
JOIN Branch ON Staff.branchNo = Branch.branchNo
WHERE Branch.street = '163 Main St';

-- 27. Find all staff whose salary is larger than the salary of at least one member of staff at branch B003.
SELECT * FROM Staff
WHERE salary > (SELECT MIN(salary) FROM Staff WHERE branchNo = 'B003');

-- 28. Find all staff whose salary is larger than the salary of every member of staff at branch B003.
SELECT * FROM Staff
WHERE salary > (SELECT MAX(salary) FROM Staff WHERE branchNo = 'B003');

-- 29. List the names of all clients who have viewed a property along with any comment supplied.
SELECT Client.fName, Client.lName, Viewing.comment FROM Viewing
JOIN Client ON Viewing.clientNo = Client.clientNo
WHERE Viewing.comment IS NOT NULL;

SELECT client.FName, client.LName, viewing.propertyNo, viewing.comment
FROM viewing
JOIN client ON viewing.clientNo = client.clientNo;

-- 30. For each branch office, list the numbers and names of staff who manage properties and the properties that they manage.
-- SELECT Branch.branchNo, Branch.street AS branch_address, 
-- Staff.staffNo, Staff.fName, Staff.lName, 
-- PropertyForRent.propertyNo
-- FROM PropertyForRent
-- JOIN Staff ON PropertyForRent.staffNo = Staff.staffNo
-- JOIN Branch ON Staff.branchNo = Branch.branchNo;

SELECT Branch.branchNo, branch.street, staff.staffNo, staff.FName, staff.LName, PropertyForRent.propertyNo
FROM PropertyForRent
JOIN Staff ON PropertyForRent.staffNo = Staff.staffNo
JOIN Branch ON Branch.branchNo = Staff.branchNo;



--- Day 5 ----------------------------
-- 31. For each branch, list the numbers and names of staff who manage properties, 
-- including the city in which the branch is located and the properties that the staff manage.
SELECT Branch.city, Branch.branchNo, Staff.staffNo, Staff.fName, Staff.lName, PropertyForRent.propertyNo
FROM PropertyForRent
JOIN Staff ON PropertyForRent.staffNo = Staff.staffNo
JOIN Branch ON Branch.branchNo = Staff.branchNo;

-- 32. Find the number of properties handled by each staff member.
SELECT Staff.staffNo, Staff.fName, Staff.lName, COUNT(PropertyForRent.propertyNo) AS num_properties
FROM PropertyForRent
JOIN Staff ON PropertyForRent.staffNo = Staff.staffNo
GROUP BY Staff.staffNo, Staff.fName, Staff.lName;

-- 33. List all branch offices and any properties that are in the same city.
SELECT Branch.city, Branch.branchNo, Branch.street AS address, PropertyForRent.propertyNo, PropertyForRent.type
FROM Branch
LEFT JOIN PropertyForRent ON Branch.city = PropertyForRent.city;

-- 34. List the branch offices and properties that are in the same city along with any unmatched branches or properties.
SELECT Branch.city AS branch_city, Branch.branchNo, 
PropertyForRent.city AS property_city, PropertyForRent.propertyNo, PropertyForRent.type 
FROM Branch 
LEFT JOIN PropertyForRent ON Branch.city = PropertyForRent.city
UNION
SELECT Branch.city AS branch_city, Branch.branchNo, 
PropertyForRent.city AS property_city, PropertyForRent.propertyNo, PropertyForRent.type 
FROM Branch 
RIGHT JOIN PropertyForRent ON Branch.city = PropertyForRent.city;



-- #34 List the branch offices and properties that are in the same city along with any unmatched branches or properties. 

SELECT Branch.city, Branch.branchNo, PropertyForRent.propertyNo FROM Branch 
LEFT JOIN PropertyForRent ON Branch.city = PropertyForRent.city
UNION
SELECT Branch.city, Branch.branchNo, PropertyForRent.propertyNo FROM PropertyForRent
RIGHT JOIN Branch ON Branch.city = PropertyForRent.city;

-- 35. Create a table OwnersPropertyCount (ownerNo, FName, LName, noOfProperty) 
-- and populate it from the existing tables.
CREATE TABLE OwnersPropertyCount AS
SELECT PrivateOwner.ownerNo, PrivateOwner.fName, PrivateOwner.lName, COUNT(PropertyForRent.propertyNo) AS noOfProperty
FROM PrivateOwner
JOIN PropertyForRent ON PrivateOwner.ownerNo = PropertyForRent.ownerNo
GROUP BY PrivateOwner.ownerNo, PrivateOwner.fName, PrivateOwner.lName;

-- 36. Give all staff a 3% pay increase.
UPDATE Staff
SET salary = salary * 1.03;

-- 37. Give all Managers a 5% pay increase.
UPDATE Staff
SET salary = salary * 1.05
WHERE position = 'Manager';

-- 38. Promote David Ford (staffNo = 'SG14') to Manager and change his salary to £18,000.
UPDATE Staff
SET position = 'Manager', salary = 18000
WHERE staffNo = 'SG14';

-- 39. Delete all viewings that relate to property PG4.
DELETE FROM Viewing
WHERE propertyNo = 'PG4';

-- 40. Delete all rows from the Viewing table.
DELETE FROM Viewing;




-- #1.Find Out staff Details who work for Same Branch which Have more than 1 Employee.
SELECT *FROM Staff WHERE branchNo IN (
SELECT branchNo FROM Staff GROUP BY branchNo
HAVING COUNT(staffNo) > 1);


-- #2.Create a View Which Display BranchNo,StaffNo.Position & ClientNo
CREATE VIEW custom AS
Select s.branchNo,s.staffNo,s.position,c.clientNo
From Staff s
JOIN Registration c ON s.staffNo = c.staffNo;

Select * FROM custom;

--  Another ans 
CREATE VIEW BranchStaffClientView AS
SELECT Staff.branchNo,Staff.staffNo,Staff.position,Registration.clientNo
FROM Staff JOIN Registration ON Staff.staffNo = Registration.staffNo;
SELECT * FROM BranchStaffClientView;

-- #3.SHOW all details from Cross Product of Staff,Registration
SELECT *
FROM Staff,Registration;

-- #4.Find the Street & city of the Branch for ALL Clients whose Max Rent > 400
SELECT c.clientNo,c.fName,c.lName,b.branchNo, b.street,b.city
FROM Client c
JOIN Registration r ON c.clientNo = r.clientNo AND maxRent > 400
JOIN Branch b ON r.branchNo = b.branchNo;


SELECT Client.clientNo,Client.fName,Client.lName,Branch.street,Branch.city
FROM Client JOIN Registration ON Client.clientNo = Registration.clientNo
JOIN Branch ON Registration.branchNo = Branch.branchNo WHERE Client.maxRent > 400;

-- 5 Find the max salary for each BranchNo
SELECT branchNo, MAX(salary)FROM  Staff
GROUP BY branchNo;



# Lab Day 6 Exercises 


-- 1. Find Second Highest Salary in each BranchNo with Designation
SELECT branchNo, position, salary
FROM (
    SELECT branchNo, position, salary, ROW_NUMBER() 
    OVER (PARTITION BY branchNo ORDER BY salary DESC) AS salary_rank FROM Staff
) AS RankedSalaries
WHERE salary_rank = 2
ORDER BY branchNo, position;




-- 2. Find the Date of Join for High Salary Holder Staff
SELECT r.dateJoined
FROM Staff s 
JOIN Registration r ON s.staffNo = r.staffNo
WHERE s.salary = (SELECT MAX(salary) FROM Staff);


-- 3. Find the PropertyNo,StaffNo,branchNo,comment from the Appropiate Tables.
SELECT P.propertyNo, P.staffNo, P.branchNo, V.comment
FROM PropertyForRent P
JOIN Viewing V ON P.propertyNo = V.propertyNo;




-- 4. Find the Staff works in Each Branch with position 
SELECT branchNo,staffNo,fName,lName,position
FROM Staff 
ORDER BY branchNo, staffNo;

-- 5.Alter table Staff and add location attribute with values 
ALTER TABLE Staff
ADD Location VARCHAR(50);
UPDATE Staff
SET Location = CASE staffNo
    WHEN 'SL21' THEN 'Paris'
    WHEN 'SG37' THEN 'Glasgow'
    WHEN 'SG14' THEN 'London'
    WHEN 'SA9'  THEN 'Paris'
    WHEN 'SG5'  THEN 'Glasgow'
    WHEN 'SL41' THEN 'London'
    ELSE Location 
END;
SELECT * FROM Staff;

-- 6.Find The Staff details where location and branchNo city is same
SELECT s.staffNo, s.fName, s.lName, s.position, s.salary, s.branchNo
FROM Staff s
JOIN Branch b ON s.branchNo = b.branchNo
WHERE b.city = (
    SELECT b2.city
    FROM Branch b2
    WHERE b2.branchNo = s.branchNo);

    
-- 7.Find room,type,rent,propertyno ,city,branchno, where postcode is same fro branchno & proprtyno
SELECT pfr.propertyNo, pfr.city, pfr.branchNo, pfr.type, pfr.rooms, pfr.rent
FROM PropertyForRent pfr
JOIN Branch b ON pfr.postcode = b.postcode
WHERE pfr.branchNo = b.branchNo;


-- 8.Find the details of owners who have maximum property
SELECT DISTINCT po.ownerNo, po.fName, po.lName, po.address, po.telNo
FROM PrivateOwner po
WHERE po.ownerNo = (
    SELECT pfr.ownerNo
    FROM PropertyForRent pfr
    GROUP BY pfr.ownerNo
    ORDER BY COUNT(pfr.propertyNo) DESC
    LIMIT 1);

-- 9.Find the details of client where fName starts with 'M'
SELECT clientNo, fName, lName, telNo, prefType, maxRent
FROM Client
WHERE fName LIKE 'M%';

-- 10.Find the owner details whose fName has 3 character
SELECT ownerNo, fName, lName, address, telNo
FROM PrivateOwner
WHERE LENGTH(fName) = 3;






