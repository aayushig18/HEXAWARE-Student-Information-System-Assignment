 /*1 Create the database named "SISDB"*/
 create database SISDataBase;
 use SISDataBase;

 CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),   
    last_name VARCHAR(50),
    date_of_birth VARCHAR(20),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);


CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);


CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);



CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount INT,
    payment_date VARCHAR (50),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
(1, 'Arjun', 'Reddy', '1999-10-10', 'arjun.reddy@example.com', '9234567890'),
(2, 'Jane', 'Smith', '2000-03-15', 'jane.smith@example.com', '1876754678'),
(3, 'Michael', 'Johnson', '2002-10-19', 'michael.johnson@example.com', '9567653215'),
(4, 'Emily', 'Brown', '1995-01-01', 'emily.brown@example.com', '9670987652'),
(5, 'David', 'Jones', '1998-05-25', 'david.jones@example.com', '2123098763'),
(6, 'Manju', 'Shilma', '2000-10-11', 'manjus.hilma@example.com', '9234557890'),
(7, 'Swetha', 'Naidu', '1999-03-23', 'swetha.naidu@example.com', '9786754867'),
(8, 'Abin', 'Surya', '2000-10-10', 'abin.surya@example.com', '8756653251'),
(9, 'Sandhiya', 'Bheema', '2001-03-12', 'sandhiya.bheema@example.com', '9076987625'),
(10, 'Dakil', 'Jones', '1998-09-29', 'dakil.jones@example.com', '9321098736');





INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
(1, 'Revathi', 'John', 'revathi.john@example.com'),
(2, 'Boby', 'Smith', 'boby.smith@example.com'),
(3, 'Manasa', 'Shetty', 'manasa.shetty@example.com'),
(4, 'Joe', 'Smith', 'joe.smith@example.com'),
(5, 'Lily', 'Mary', 'lily.mary@example.com'),
(6, 'Kayal', 'Shree', 'kayal.shree@example.com'),
(7, 'Roshini', 'Veera', 'roshini.veera@example.com'),
(8, 'Robert', 'Johny', 'robert.johny@example.com'),
(9, 'Surya', 'Kumar', 'surya.kumar@example.com'),
(10, 'Mahendra', 'singh', 'mahendra.singh@example.com');



INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
(1, 'CSE', 3, 1),
(2, 'EEE', 4, 2),
(3, 'ECE', 3, 10),
(4, 'IT', 2, 7),
(5, 'BCA', 1, 7),
(6, 'BBA', 2, 8),
(7, 'BSC', 3, 9),
(8, 'MSC', 3, 6),
(9, 'BA', 4, 3),
(10, 'MCA', 3, 2);


INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(1, 1, 8, '2022-10-19'),
(2, 2, 1, '2023-02-20'),
(3, 3, 4, '2023-03-18'),
(4, 9, 8, '2023-01-01'),
(5, 2, 5, '2022-04-02'),
(6, 7, 1, '2022-09-14'),
(7, 5, 1, '2023-05-15'),
(8, 10, 10, '2022-06-14'),
(9, 1, 4, '2023-07-13'),
(10, 8, 6, '2022-10-19');



INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
(1, 1, 10000, '2023-2-22'),
(2, 2, 15000, '2023-3-20'),
(3, 1, 20000, '2023-1-10'),
(4, 4, 9000, '2023-4-4'),
(5, 5, 15000, '2022-4-4'),
(6, 4, 30000, '2021-10-15'),
(7, 7, 10000, '2023-5-25'),
(8, 4, 18000, '2022-8-20'),
(9, 9, 21000, '2023-9-29'),
(10, 10, 31000, '2022-10-30');

