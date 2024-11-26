-- Student table
CREATE TABLE student (
        s_name VARCHAR(50),
        roll_no INT ,
        age INT
    );

INSERT INTO student VALUES
("Ujjwal Kamila",033,20),
("Aashiq Rahaman",034,21),
("Achintya Barman",038,22),
("Rudra Das", 045,21);

UPDATE student
SET age = 25
WHERE roll_no = 033;

DELETE FROM student
WHERE roll_no = 045;