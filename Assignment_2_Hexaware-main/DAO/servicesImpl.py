import pyodbc
from util.dbconn import DBConnection
from DAO.services import *
from Exception.myexceptions import (
    DuplicateEnrollmentException, CourseNotFoundException, StudentNotFoundException,
    TeacherNotFoundException, PaymentValidationException, InvalidStudentDataException,
    InvalidCourseDataException, InvalidEnrollmentDataException, InvalidTeacherDataException,
    InsufficientFundsException
)
from Entity import Student
from Entity import Course, Enrollment, Teacher, Payment, Student

class StudentServiceImpl(StudentDAO, DBConnection):

    def Add_student(self):
        first_name = input("Enter first name: ")
        last_name = input("Enter last name: ")
        date_of_birth = input("Enter date of birth (YYYY-MM-DD): ")
        email = input("Enter email: ")
        phone_number = input("Enter phone number: ")
        
        if not all([first_name, last_name, date_of_birth, email, phone_number]):
            raise InvalidStudentDataException("All fields are required.")
        
        date_of_birth = str(date_of_birth)
        phone_number = str(phone_number)
        
        self.cursor.execute(
            "INSERT INTO students (first_name, last_name, date_of_birth, email, phone_number) VALUES (?, ?, ?, ?, ?)",
            (first_name, last_name, date_of_birth, email, phone_number)
        )
        self.conn.commit()
        print("Student added successfully!")

    def Update_student(self):
        student_id = input("Enter the student ID to update: ")
        first_name = input("Enter updated first name: ")
        last_name = input("Enter updated last name: ")
        date_of_birth = input("Enter updated date of birth (YYYY-MM-DD): ")
        email = input("Enter updated email: ")
        phone_number = input("Enter updated phone number: ")

        self.cursor.execute(
            "UPDATE students SET first_name=?, last_name=?, date_of_birth=?, email=?, phone_number=? WHERE student_id=?",
            (first_name, last_name, date_of_birth, email, phone_number, student_id)
        )
        self.conn.commit()
        print("Student updated successfully!")

    def Get_student(self):
        try:
            student_id = int(input("Enter student ID: "))
            print("Searching for student with ID:", student_id)

        # Execute the query to find the student by ID
            self.cursor.execute("SELECT * FROM students WHERE student_id = ?", (student_id,))
            row = self.cursor.fetchone()
        
            if row:
                print("Student found:", row)
            # Ensure that the row data corresponds to the Student constructor
                student = Student(*row)  # Make sure this is correct according to your class definition
                return student
            else:
                raise StudentNotFoundException(f"No student found with ID: {student_id}")
    
        except StudentNotFoundException as e:
            print(str(e))  # Handle custom exception if student is not found
        except Exception as e:
            print("Error retrieving student:", e)

    def Delete_student(self):
        student_id = int(input("Enter student ID: "))

        self.cursor.execute("DELETE FROM students WHERE student_id = ?", (student_id,))
        self.conn.commit()
        print("Student deleted successfully!")

    def Get_all_students(self):
        try:
            self.cursor.execute("SELECT * FROM students")
            students = [Student(*row) for row in self.cursor.fetchall()]
            
            if students:
                print("All students:")
                for student in students:
                    print(f"Student ID: {student.student_id}")
                    print(f"First Name: {student.first_name}")
                    print(f"Last Name: {student.last_name}")
                    print(f"Date of Birth: {student.date_of_birth}")
                    print(f"Email: {student.email}")
                    print(f"Phone Number: {student.phone_number}")
                    print()
            else:
                print("No students found.")
        except Exception as e:
            print("Error retrieving students:", e)


class CourseServiceImpl(CourseDAO, DBConnection):

    def Add_course(self):
        course_id = int(input("Enter course ID: "))
        course_name = input("Enter course name: ")
        teacher_id = int(input("Enter teacher ID: "))
        credits = int(input("Enter credits: "))
        
        if not course_name or credits <= 0:
            raise InvalidCourseDataException("Course name is required and credits should be a positive number.")
        
        self.cursor.execute(
            "INSERT INTO courses (course_id, course_name, teacher_id, credits) VALUES (?, ?, ?, ?)",
            (course_id, course_name, teacher_id, credits)
        )
        self.conn.commit()
        print("Course added successfully!")

    def Update_course(self):
        course_id = int(input("Enter course ID: "))
        course_name = input("Enter updated course name: ")
        teacher_id = int(input("Enter updated teacher ID: "))
        credits = int(input("Enter updated credits: "))

        self.cursor.execute(
            "UPDATE courses SET course_name=?, teacher_id=?, credits=? WHERE course_id=?",
            (course_name, teacher_id, credits, course_id)
        )
        self.conn.commit()
        print("Course updated successfully!")

    def Get_course(self):
        try:
            course_id = int(input("Enter course ID: "))
            self.cursor.execute("SELECT * FROM courses WHERE course_id = ?", (course_id,))
            row = self.cursor.fetchone()

            if row:
                course = Course(*row)
                print(f"Course ID: {course.course_id}")
                print(f"Course Name: {course.course_name}")
                print(f"Credits: {course.credits}")
                print(f"Teacher ID: {course.teacher_id}")
            else:
                raise CourseNotFoundException(f"No course found with ID: {course_id}")
        
        except CourseNotFoundException as e:
            print(str(e))
        except Exception as e:
            print("Error retrieving course:", e)

    def Delete_course(self):
        course_id = int(input("Enter course ID: "))

        self.cursor.execute("DELETE FROM courses WHERE course_id = ?", (course_id,))
        self.conn.commit()
        print("Course deleted successfully!")

    def Get_all_courses(self):
        try:
            self.cursor.execute("SELECT * FROM courses")
            courses = [Course(*row) for row in self.cursor.fetchall()]

            if courses:
                for course in courses:
                    print(f"Course ID: {course.course_id}")
                    print(f"Course Name: {course.course_name}")
                    print(f"Credits: {course.credits}")
                    print(f"Teacher ID: {course.teacher_id}")
            else:
                print("No courses found.")
        except Exception as e:
            print("Error retrieving courses:", e)


class EnrollmentServiceImpl(EnrollmentDAO, DBConnection):

    def Add_enrollment(self):
        student_id = int(input("Enter student ID: "))
        course_id = int(input("Enter course ID: "))
        enrollment_date = input("Enter enrollment date: ")

        if not enrollment_date:
            raise InvalidEnrollmentDataException("Enrollment date is required.")

        self.cursor.execute("SELECT * FROM enrollments WHERE student_id = ? AND course_id = ?", (student_id, course_id))
        existing = self.cursor.fetchone()

        if existing:
            raise DuplicateEnrollmentException("Student is already enrolled in the course.")

        self.cursor.execute(
            "INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES (?, ?, ?)",
            (student_id, course_id, enrollment_date)
        )
        self.conn.commit()
        print("Enrollment added successfully!")

    def Update_enrollment(self):
        enrollment_id = int(input("Enter enrollment ID: "))
        student_id = int(input("Enter updated student ID: "))
        course_id = int(input("Enter updated course ID: "))
        enrollment_date = input("Enter updated enrollment date: ")

        self.cursor.execute(
            "UPDATE enrollments SET student_id=?, course_id=?, enrollment_date=? WHERE enrollment_id=?",
            (student_id, course_id, enrollment_date, enrollment_id)
        )
        self.conn.commit()
        print("Enrollment updated successfully!")

    def Get_enrollment(self):
        enrollment_id = int(input("Enter enrollment ID: "))

        self.cursor.execute("SELECT * FROM enrollments WHERE enrollment_id = ?", (enrollment_id,))
        row = self.cursor.fetchone()

        if row:
            enrollment = Enrollment(*row)
            print(f"Enrollment ID: {enrollment.enrollment_id}")
            print(f"Student ID: {enrollment.student_id}")
            print(f"Course ID: {enrollment.course_id}")
            print(f"Enrollment Date: {enrollment.enrollment_date}")
        else:
            print("No enrollment found with ID:", enrollment_id)

    def Delete_enrollment(self):
        enrollment_id = int(input("Enter enrollment ID: "))

        self.cursor.execute("DELETE FROM enrollments WHERE enrollment_id = ?", (enrollment_id,))
        self.conn.commit()
        print("Enrollment deleted successfully!")

    def Get_all_enrollments(self):
        try:
            self.cursor.execute("SELECT * FROM enrollments")
            enrollments = [Enrollment(*row) for row in self.cursor.fetchall()]

            if enrollments:
                for enrollment in enrollments:
                    print(f"Enrollment ID: {enrollment.enrollment_id}")
                    print(f"Student ID: {enrollment.student_id}")
                    print(f"Course ID: {enrollment.course_id}")
                    print(f"Enrollment Date: {enrollment.enrollment_date}")
            else:
                print("No enrollments found.")
        except Exception as e:
            print("Error retrieving enrollments:", e)


class TeacherServiceImpl(TeacherDAO, DBConnection):

    def Add_teacher(self):
        first_name = input("Enter first name: ")
        last_name = input("Enter last name: ")
        email = input("Enter email: ")

        if not all([first_name, last_name, email]):
            raise InvalidTeacherDataException("All fields are required.")

        self.cursor.execute(
            "INSERT INTO teachers (first_name, last_name, email) VALUES (?, ?, ?)",
            (first_name, last_name, email)
        )
        self.conn.commit()
        print("Teacher added successfully!")

    def Update_teacher(self):
        teacher_id = int(input("Enter teacher ID: "))
        first_name = input("Enter updated first name: ")
        last_name = input("Enter updated last name: ")
        email = input("Enter updated email: ")

        self.cursor.execute(
            "UPDATE teachers SET first_name=?, last_name=?, email=? WHERE teacher_id=?",
            (first_name, last_name, email, teacher_id)
        )
        self.conn.commit()
        print("Teacher updated successfully!")

    def Get_teacher(self):
        teacher_id = int(input("Enter teacher ID: "))

        self.cursor.execute("SELECT * FROM teachers WHERE teacher_id = ?", (teacher_id,))
        row = self.cursor.fetchone()

        if row:
            teacher = Teacher(*row)
            print(f"Teacher ID: {teacher.teacher_id}")
            print(f"First Name: {teacher.first_name}")
            print(f"Last Name: {teacher.last_name}")
            print(f"Email: {teacher.email}")
        else:
            print(f"No teacher found with ID: {teacher_id}")

    def Delete_teacher(self):
        teacher_id = int(input("Enter teacher ID: "))

        self.cursor.execute("DELETE FROM teachers WHERE teacher_id = ?", (teacher_id,))
        self.conn.commit()
        print("Teacher deleted successfully!")

    def Get_all_teachers(self):
        try:
            self.cursor.execute("SELECT * FROM teachers")
            teachers = [Teacher(*row) for row in self.cursor.fetchall()]

            if teachers:
                for teacher in teachers:
                    print(f"Teacher ID: {teacher.teacher_id}")
                    print(f"First Name: {teacher.first_name}")
                    print(f"Last Name: {teacher.last_name}")
                    print(f"Email: {teacher.email}")
            else:
                print("No teachers found.")
        except Exception as e:
            print("Error retrieving teachers:", e)


class PaymentServiceImpl(PaymentDAO, DBConnection):

    def Add_payment(self):
        enrollment_id = int(input("Enter enrollment ID: "))
        payment_amount = float(input("Enter payment amount: "))

        self.cursor.execute(
            "INSERT INTO payments (enrollment_id, payment_amount) VALUES (?, ?)",
            (enrollment_id, payment_amount)
        )
        self.conn.commit()
        print("Payment added successfully!")

    def Update_payment(self):
        payment_id = int(input("Enter payment ID: "))
        enrollment_id = int(input("Enter updated enrollment ID: "))
        payment_amount = float(input("Enter updated payment amount: "))

        self.cursor.execute(
            "UPDATE payments SET enrollment_id=?, payment_amount=? WHERE payment_id=?",
            (enrollment_id, payment_amount, payment_id)
        )
        self.conn.commit()
        print("Payment updated successfully!")

    def Get_payment(self):
        payment_id = int(input("Enter payment ID: "))

        self.cursor.execute("SELECT * FROM payments WHERE payment_id = ?", (payment_id,))
        row = self.cursor.fetchone()

        if row:
            payment = Payment(*row)
            print(f"Payment ID: {payment.payment_id}")
            print(f"Enrollment ID: {payment.enrollment_id}")
            print(f"Payment Amount: {payment.payment_amount}")
        else:
            print(f"No payment found with ID: {payment_id}")

    def Delete_payment(self):
        payment_id = int(input("Enter payment ID: "))

        self.cursor.execute("DELETE FROM payments WHERE payment_id = ?", (payment_id,))
        self.conn.commit()
        print("Payment deleted successfully!")

    def Get_all_payments(self):
        try:
            self.cursor.execute("SELECT * FROM payments")
            payments = [Payment(*row) for row in self.cursor.fetchall()]

            if payments:
                for payment in payments:
                    print(f"Payment ID: {payment.payment_id}")
                    print(f"Enrollment ID: {payment.enrollment_id}")
                    print(f"Payment Amount: {payment.payment_amount}")
            else:
                print("No payments found.")
        except Exception as e:
            print("Error retrieving payments:", e)
