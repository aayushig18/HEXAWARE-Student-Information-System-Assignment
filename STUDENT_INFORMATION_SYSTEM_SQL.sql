 /*1 Create the database named "SISDB"*/
 CREATE DATABASE SISDB;
 USE SISDB;
 
/*2 Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based
on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data
types, constraints, and relationships.
a. Students
b. Courses
c. Enrollments
d. Teacher
e. Payments*/

 CREATE TABLE Students(
 student_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
 );

 CREATE TABLE Courses(
 course_id VARCHAR(10) PRIMARY KEY,
 course_name VARCHAR(100),
 credits INT,
 teacher_id VARCHAR(10) FOREIGN KEY REFERENCES Teacher(teacher_id)
 );

 CREATE TABLE Enrollments (
    enrollment_id VARCHAR(10) PRIMARY KEY,
    student_id VARCHAR(10) FOREIGN KEY REFERENCES Students(student_id),
    course_id VARCHAR(10) FOREIGN KEY REFERENCES Courses(course_id),
    enrollment_date DATE
);

CREATE TABLE Teacher (
    teacher_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Payments (
    payment_id VARCHAR(10) PRIMARY KEY,
    student_id VARCHAR(10) FOREIGN KEY REFERENCES Students(student_id),
    amount DECIMAL(10, 2),
    payment_date DATE
);


/*4. Create appropriate Primary Key and Foreign Key constraints for referential integrity
Ans. Yes , I have already defined primary and foreign key constraints in the SQL script
above.*/

/*5 Insert at least 10 sample records into each of the following tables.
i. Students
ii. Courses
iii. Enrollments
iv. Teacher
v. Payments*/

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
('S101', 'Aayushi', 'Gupta', '2001-02-18', 'aayushi@gmail.com', '9686129348'),
('S102', 'Alice', 'Smith', '1996-07-20', 'alice.smith@example.com', '9876543210'),
('S103', 'Bob', 'Johnson', '1997-03-12', 'bob.johnson@example.com', '1122334455'),
('S104', 'Charlie', 'Brown', '1995-11-22', 'charlie.brown@example.com', '5566778899'),
('S105', 'Diana', 'Miller', '1996-02-28', 'diana.miller@example.com', '6677889900'),
('S106', 'Eva', 'Wilson', '1997-09-05', 'eva.wilson@example.com', '2233445566'),
('S107', 'Frank', 'Garcia', '1995-12-12', 'frank.garcia@example.com', '7788990011'),
('S108', 'Grace', 'Martinez', '1996-04-04', 'grace.martinez@example.com', '8899001122'),
('S109', 'Henry', 'Davis', '1997-06-18', 'henry.davis@example.com', '3344556677'),
('S110', 'Ivy', 'Rodriguez', '1995-10-10', 'ivy.rodriguez@example.com', '9988776655');


INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
('C101', 'Introduction to Programming', 4, 'T101'),
('C102', 'Mathematics 101', 3, 'T102'),
('C103', 'Physics 101', 4, 'T103'),
('C104', 'Chemistry 101', 4, 'T104'),
('C105', 'English Literature', 2, 'T105'),
('C106', 'History of Art', 3, 'T106'),
('C107', 'Advanced Calculus', 4, 'T102'),
('C108', 'Database Management', 4, 'T107'),
('C109', 'Operating Systems', 4, 'T101'),
('C110', 'Network Security', 3, 'T108');

-- Insert data into Teacher table
INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
('T101', 'Sarah', 'Johnson', 'sarah.johnson@example.com'),
('T102', 'Mark', 'Smith', 'mark.smith@example.com'),
('T103', 'Emily', 'Davis', 'emily.davis@example.com'),
('T104', 'James', 'Brown', 'james.brown@example.com'),
('T105', 'Laura', 'Garcia', 'laura.garcia@example.com'),
('T106', 'Daniel', 'Martinez', 'daniel.martinez@example.com'),
('T107', 'Susan', 'Wilson', 'susan.wilson@example.com'),
('T108', 'Michael', 'Rodriguez', 'michael.rodriguez@example.com');

INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
('T109', 'Aditi', 'Singh', 'aditi.singh@example.com'),
('T110', 'Shreyash', 'Shukla', 'shreyash.shukla@example.com');

-- Insert sample data into Enrollments table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
('E101', 'S101', 'C101', '2023-01-15'),
('E102', 'S102', 'C102', '2023-02-20'),
('E103', 'S103', 'C103', '2023-03-12'),
('E104', 'S104', 'C104', '2023-04-25'),
('E105', 'S105', 'C105', '2023-05-10'),
('E106', 'S106', 'C106', '2023-06-22'),
('E107', 'S107', 'C107', '2023-07-30'),
('E108', 'S108', 'C108', '2023-08-05'),
('E109', 'S109', 'C109', '2023-09-15'),
('E110', 'S110', 'C110', '2023-10-20');

-- Insert sample data into Payments table
INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
('P101', 'S101', 500.00, '2023-01-20'),
('P102', 'S102', 300.00, '2023-02-25'),
('P103', 'S103', 450.00, '2023-03-18'),
('P104', 'S104', 600.00, '2023-04-30'),
('P105', 'S105', 350.00, '2023-05-12'),
('P106', 'S106', 400.00, '2023-06-24'),
('P107', 'S107', 550.00, '2023-07-31'),
('P108', 'S108', 650.00, '2023-08-10'),
('P109', 'S109', 475.00, '2023-09-18'),
('P110', 'S110', 525.00, '2023-10-22');

/*1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890*/

insert into Students values ('S111','John','Doe','1995-08-15','john.doe@example.com','1234567890');

/*2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
insert a record into the "Enrollments" table with the enrollment date.*/

INSERT INTO Enrollments
VALUES('E111','S101','C101','2024-09-10');

/*3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
modify their email address*/

update Teacher
set email='marki@gmail.com'
where teacher_id='T102' ;

/*4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
an enrollment record based on the student and course*/

delete from Enrollments
where student_id='S102' and course_id='C102';

/*5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
teacher from the respective tables*/

update Courses
set teacher_id='T101'
where course_id='C106';


/*6. Delete a specific student from the "Students" table and remove all their enrollment records
from the "Enrollments" table. Be sure to maintain referential integrity*/
/*Ans : In order to maintain referential integrity following steps are to be followed
-Delete the enrollments for the student. - Delete any payments associated with the student. - Delete the student.*/
DELETE FROM Enrollments
WHERE student_id = 'S103';

DELETE FROM Payments
WHERE student_id = 'S103';

DELETE FROM Students
WHERE student_id = 'S103';

/*7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
payment record and modify the payment amount.*/

UPDATE Payments
SET amount = 600.00
WHERE payment_id = 'P101';




/*Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:*/
/*1. Write an SQL query to calculate the total payments made by a specific student. You will need to
join the "Payments" table with the "Students" table based on the student's ID.*/

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 'S107'  
GROUP BY s.first_name, s.last_name, s.student_id;

/*2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table*/

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
JOIN Enrollments e 
ON c.course_id = e.course_id
GROUP BY c.course_name;

/*3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
without enrollments*/

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e 
ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

/*4. Write an SQL query to retrieve the first name, last name of students, and the names of the
courses they are enrolled in. Use JOIN operations between the "Students" table and the
"Enrollments" and "Courses" tables.*/

SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

/*5. Create a query to list the names of teachers and the courses they are assigned to. Join the
"Teacher" table with the "Courses" table.*/

SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
JOIN Courses c 
ON t.teacher_id = c.teacher_id;

/*6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to
join the "Students" table with the "Enrollments" and "Courses" tables.*/

SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'English Literature';

/*7. Find the names of students who have not made any payments. Use a LEFT JOIN between
the "Students" table and the "Payments" table and filter for students with NULL payment
records.*/

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;

/*8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT
JOIN between the "Courses" table and the "Enrollments" table and filter for courses with
NULL enrollment records*/

SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

/*9. Identify students who are enrolled in more than one course. Use a self-join on the
"Enrollments" table to find students with multiple enrollment records.*/

SELECT s.first_name, s.last_name, COUNT(e.course_id) AS course_count
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1;

/*10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the
"Teacher" table and the "Courses" table and filter for teachers with NULL course
assignments.*/

SELECT t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;




/*Task 4. Subquery and its type:*/
/*1. Write an SQL query to calculate the average number of students enrolled in each course. Use
aggregate functions and subqueries to achieve this.*/

SELECT AVG(enrol_count) AS Average_students_per_course
FROM (
    SELECT COUNT(e.student_id) AS enrol_count
    FROM Enrollments e
    GROUP BY e.course_id
) AS course_enrol;

/*2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
payment amount and then retrieve the student(s) associated with that amount.*/

SELECT s.first_name, s.last_name, p.amount as Max_amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount)  FROM Payments);

/*3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
course(s) with the maximum enrollment count.*/

SELECT course_name
FROM Courses c
WHERE c.course_id = (SELECT TOP 1 e.course_id 
                     FROM Enrollments e 
                     GROUP BY e.course_id 
                     ORDER BY COUNT(e.student_id) DESC);

/*4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
payments for each teacher's courses*/

SELECT t.first_name, t.last_name, 
       (SELECT SUM(p.amount)
        FROM Payments p
        JOIN Enrollments e ON p.student_id = e.student_id
        WHERE e.course_id IN 
              (SELECT course_id 
               FROM Courses 
               WHERE teacher_id = t.teacher_id)) AS total_payments
FROM Teacher t;

/*5. Identify students who are enrolled in all available courses. Use subqueries to compare a
student's enrollments with the total number of courses*/

SELECT S.student_id, S.first_name, S.last_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.student_id, S.first_name, S.last_name
HAVING COUNT(DISTINCT E.course_id) = (SELECT COUNT(*) FROM Courses);

/*6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
find teachers with no course assignments.*/

SELECT t.first_name, t.last_name
FROM Teacher t
WHERE NOT EXISTS (SELECT 1 
                  FROM Courses c 
                  WHERE c.teacher_id = t.teacher_id);

/*7. Calculate the average age of all students. Use subqueries to calculate the age of each
student based on their date of birth.*/

 SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students;

/*8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
records.*/

SELECT course_name
FROM Courses c
WHERE NOT EXISTS (SELECT 1 FROM Enrollments e 
                  WHERE e.course_id = c.course_id);

/*9. Calculate the total payments made by each student for each course they are enrolled in. Use
subqueries and aggregate functions to sum payments*/

SELECT s.first_name, s.last_name, c.course_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name, c.course_name;

/*10. Identify students who have made more than one payment. Use subqueries and aggregate
functions to count payments per student and filter for those with counts greater than one.*/

SELECT s.first_name, s.last_name, COUNT(p.payment_id) AS payment_count
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(p.payment_id) > 1;

/*11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
student.*/

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name;

/*12. Retrieve a list of course names along with the count of students enrolled in each course. Use
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
count enrollments.*/

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

/*13. Calculate the average payment amount made by students. Use JOIN operations between the
"Students" table and the "Payments" table and GROUP BY to calculate the average.*/

SELECT S.student_id,S.first_name, S.last_name, AVG(P.amount) AS average_payment
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;




