--Part A (DDL) :1. Create table the following tables and their given constraints:
SET AUTOCOMMIT ON;
CREATE TABLE MOVIES (
movieid int PRIMARY KEY,
title varchar(35) NOT NULL,
releaseYear int NOT NULL,
director int NOT NULL,
score decimal(3,2) CHECK (score > 0 AND score < 5)
);

CREATE TABLE ACTORS (
actorid int PRIMARY KEY,
firstName varchar(20) NOT NULL,
lastName varchar(30) NOT NULL
);

CREATE TABLE CASTINGS (
movieid int,
actorid int,
PRIMARY KEY (movieid, actorid),
FOREIGN KEY (movieid) REFERENCES movies(movieid),
FOREIGN KEY (actorid) REFERENCES actors(actorid)
);

CREATE TABLE DIRECTORS (
directorid int PRIMARY KEY,
firstname varchar(20) NOT NULL,
lastname varchar(30) NOT NULL
);

--2. Modify the movies table to create a foreign key constraint that refers to table directors.
ALTER TABLE MOVIES
ADD CONSTRAINT FK_director
FOREIGN KEY(director) REFERENCES DIRECTORS(directorid);

--3. Modify the movies table to create a new constraint so the uniqueness of the movie title isguaranteed.
ALTER TABLE MOVIES
ADD CONSTRAINT UNIQUE_Title
UNIQUE (title);

--Write insert statements to add the following data to table directors and movies.
INSERT ALL
INTO DIRECTORS (directorid, firstName, lastName)VALUES (1010, 'Rob', 'Minkoff')
INTO DIRECTORS (directorid, firstName, lastName)VALUES (1020, 'Bill', 'Condon')
INTO DIRECTORS (directorid, firstName, lastName)VALUES (1050, 'Josh', 'Cooley')
INTO DIRECTORS (directorid, firstName, lastName)VALUES (2010, 'Brad', 'Bird')
INTO DIRECTORS (directorid, firstName, lastName)VALUES (3020, 'Lake', 'Bell')
SELECT * FROM dual;

INSERT ALL
INTO MOVIES (movieid, title, releaseyear, director, score)VALUES (100, 'The Lion King', 2019, 3020, 3.50)
INTO MOVIES (movieid, title, releaseyear, director, score)VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20)
INTO MOVIES (movieid, title, releaseyear, director, score)VALUES (300, 'Toy Story 4', 2019, 1020, 4.50)
INTO MOVIES (movieid, title, releaseyear, director, score)VALUES (400, 'Mission Impossible', 2018, 2010, 5.00)
INTO MOVIES (movieid, title, releaseyear, director, score)VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90)
SELECT * FROM dual;

--5. Write SQL statements to remove all above tables.Is the order of tables important when removing? Why?
--order does matter when removing. As a PRIMARY KEY of a table can be a FOREIGN KEY to another table.
DROP TABLE CASTINGS;
DROP TABLE ACTORS;
DROP TABLE MOVIES;
DROP TABLE DIRECTORS;

--6. Create a new empty table employee2 the same as table employees. Use a single statement tocreate the table and insert the data at the same time.
CREATE TABLE employee2 AS
(SELECT * FROM employees);

--7. Modify table employee2 and add a new column username to this table. The value of this columnis not required and does not have to be unique.
ALTER TABLE employee2
ADD username varchar(50);

--8. Delete all the data in the employee2 table
DELETE FROM employee2;

--9. Re-insert all data from the employees table into your new table employee2 using a singlestatement.
INSERT INTO employee2
SELECT * FROM employees;

--10. In table employee2, write a SQL statement to change the first name and the last name ofemployee with ID 1002 to your name.
UPDATE employee2
SET firstname = 'Dil', lastname = 'Borna'
WHERE EMPLOYEENUMBER = 1002;

--11. In table employee2, generate the email address for column username for each student by concatenating the first character of employee’s first name and the employee’s last name. For instance, the username of employee Peter Stone will be pstone. NOTE: the username is in alllower case letter.
UPDATE employee2
SET username = LOWER(SUBSTR(firstname, 1, 1) || lastname);

--12. In table employee2, remove all employees with office code 4.
DELETE FROM employee2
WHERE officecode = 4;

--13. Drop table employee2
DROP TABLE employee2;