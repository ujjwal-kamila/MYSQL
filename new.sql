--  pca 1

-- make a table of students 
CREATE TABLE student(
    ID VARCHAR(10) PRIMARY KEY,
    Fname VARCHAR(50),
    Mname VARCHAR(50),
    Lname VARCHAR(50),
    Course VARCHAR(50),
    Subjects VARCHAR(20),
    Marks INT NOT NULL,
    City VARCHAR(50),
    Ph_no INT 
);

--  Insert Data
INSERT INTO student (ID, Fname, Mname, Lname, Course, Subjects, Marks, City, Ph_no) VALUES
('S101', 'Koushik', 'Kumar', 'Roy', 'CSE', 'Java', 69, 'Delhi', '3452'),
('S102', 'Suhanj', NULL, 'HaLdar', 'IT', 'ML', 72, 'Kolkata', '8763'),
('S103', 'Akash', 'Kumar', 'Basu', 'ME', 'Physics', 70, 'Kolkata', '3678'),
('S104', 'Armina', 'Kumari', NULL, 'CE', 'Chemistry', 64, 'Agartala', '5423'),
('S106', 'Kajol', 'Kumari', 'Singh', 'IT', 'Java', 74, 'Agartala', '523'),
('S107', 'Uday', NULL, 'Ghosh', 'CSE', 'ML', 79, 'Chennai', '2897'),
('S108', 'Tanishk', 'Kumar', NULL, 'MCA', 'Maths', 79, 'Indore', '8907'),
('S109', 'Rohini', NULL, NULL, 'CSE', 'Java', 74, 'Chennai', '8998'),
('S1010', 'Prakash', NULL, 'Das', 'MCA', 'DBMS', 76, 'Kolkata', '4327');



Step 3: Solve Queries
-- 1. Find the details of all students who have CSE course and Java subjects.
SELECT * FROM student 
WHERE Course = 'CSE' AND Subjects = 'Java';



-- 2. Find the details of the student whose second last character of the first name is 's'.
SELECT * FROM student 
WHERE Fname LIKE '%s_';


-- 3. Find the details of employees whose marks are greater than 65 and less than 75.
SELECT * FROM student WHERE
marks > 65 AND marks<75;

-- 4. Add primary key constraints in the Student table for SID and Ph_no.
ALTER TABLE student DROP PRIMARY KEY;
ALTER TABLE student ADD CONSTRAINT pk_students PRIMARY KEY (ID, Ph_no);

-- 5. List the details of students who have a middle name.
SELECT * FROM student WHERE 
Mname IS NOT NULL;

-- 6. Find the details of students whose first name starts with 'A' and have a middle name and last name.
SELECT * FROM student WHERE 
Fname LIKE 'A%' AND Mname IS NOT NULL AND Lname IS NOT NULL;

-- 7. Change the attribute name Course to Stream in the Student table.
ALTER TABLE student 
CHANGE Course Stream VARCHAR(10);

-- 8. Drop the primary key constraint from the table.

ALTER TABLE student  DROP PRIMARY KEY;

-- 9. List the details of students who are in CSE with marks greater than 70.
SELECT * FROM student 
WHERE Course = 'CSE' AND Marks > 70;


-- 10. Find the details of students who are from Kolkata, Chennai, and Delhi and have a last name.
SELECT * FROM student 
WHERE City IN ('Kolkata', 'Chennai', 'Delhi') AND Lname IS NOT NULL;


SELECT * FROM student 
WHERE City IN ('Kolkata', 'Chennai', 'Delhi') HAVING Lname IS NOT NULL;




 -- 2ND TABLES ANS  ----  


-- Step 1: Create Table
CREATE TABLE Students (
    ID VARCHAR(10),
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Dept VARCHAR(10),
    Subject VARCHAR(50),
    Marks INT
);
-- Step 2: Insert Data
INSERT INTO Students (ID, Fname, Lname, Dept, Subject, Marks) VALUES
('S101', 'Ankita', 'Sen', 'CSE', 'C', 78),
('S102', 'Manisha', '', 'MCA', 'Java', 87),
('S103', 'Mohit', 'Roy', 'IT', 'Java', 87),
('S104', 'Asmita', 'Ghosh', 'MCA', 'Data Structure', 87),
('S105', 'Tanmoy', '', 'IT', 'C', 85),
('S106', 'Taniya', 'Pati', 'CSE', 'Java', 92),
('S107', 'Kajal', 'Kumari', 'CSE', 'Algorithm', 87),
('S108', 'Soma', 'Sarkar', 'CSE', 'Data Structure', 72),
('S109', 'Rimi', 'Roy', 'MCA', 'DBMS', 75),
('S110', 'Supriya', 'Saha', 'IT', 'Python', 80),
('S111', 'Rima', 'Roy', 'MCA', 'Operation Research', 80),
('S112', 'Sujit', '', 'MCA', 'Marketing', 75),
('S113', 'Ajay', 'Kumar', 'MCA', 'Data Structure', 80),
('S114', 'Ekta', 'Roy', 'CSE', 'Algorithm', 90),
('S115', 'Taniya', 'Roy', 'CSE', 'Python', 65);
-- Step 3: Solve Queries
-- 1. List the details of unique subjects.
SELECT DISTINCT Subject FROM Students;
-- 2. Find the details of the 2nd highest marks of the MCA department.
SELECT * FROM Students 
WHERE Dept = 'MCA' 
AND Marks = (SELECT DISTINCT Marks 
             FROM Students 
             WHERE Dept = 'MCA' 
             ORDER BY Marks DESC 
             LIMIT 1 OFFSET 1);
-- 3. List the details of students with more than one student in each department and no last name.
SELECT * FROM Students 
WHERE Lname = '' 
AND Dept IN (SELECT Dept FROM Students GROUP BY Dept HAVING COUNT(*) > 1);
-- 4. Find the details of students with maximum marks in each department.
SELECT * FROM Students s1 
WHERE Marks = (SELECT MAX(Marks) FROM Students s2 WHERE s2.Dept = s1.Dept);
-- 5. Find the details of the department with the maximum number of students.
SELECT Dept, COUNT(*) as StudentCount 
FROM Students 
GROUP BY Dept 
ORDER BY StudentCount DESC 
LIMIT 1;
-- 6. List the details of the 3rd highest marks in each subject.
SELECT * FROM Students s1
WHERE Marks = (SELECT DISTINCT Marks FROM Students s2 
               WHERE s2.Subject = s1.Subject 
               ORDER BY Marks DESC 
               LIMIT 1 OFFSET 2);
-- 7. List the details of students who scored more than the average in each subject.
SELECT * FROM Students s1 
WHERE Marks > (SELECT AVG(Marks) FROM Students s2 WHERE s2.Subject = s1.Subject);
-- 8. Update the last name of SID S106 with 'Saha'.
UPDATE Students 
SET Lname = 'Saha' 
WHERE ID = 'S106';
-- 9. List the details of students whose Python marks are in the range of 70 to 85.
SELECT * FROM Students 
WHERE Subject = 'Python' 
AND Marks BETWEEN 70 AND 85;













