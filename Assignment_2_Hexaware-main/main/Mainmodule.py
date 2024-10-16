import sys
sys.path.append('C:\\Users\\asus\\OneDrive\\Desktop\\Assignment_2_Hexaware-main')
from Entity.Student import Student
from Entity.Student import Student
from Entity.Course import Course
from Entity.Enrollment import Enrollment
from Entity.Payment import Payment
from Entity.Teacher import Teacher
from datetime import datetime
from Exception.myexceptions import InvalidDataException
from DAO.servicesImpl import CourseServiceImpl, EnrollmentServiceImpl, PaymentServiceImpl, StudentServiceImpl, TeacherServiceImpl



class Main:
    def _init_(self):
        self.loop = None

    def main(self):
        self.loop = True
        while self.loop:
            try:
                student_service = StudentServiceImpl()
                course_service = CourseServiceImpl()
                enrollment_service = EnrollmentServiceImpl()
                teacher_service = TeacherServiceImpl()
                payment_service= PaymentServiceImpl()
                print("Welcome to  the Student Information System 🎇")
                print("Select option to use functionalities: ")
                print("1.Student\n2.Course\n3.Enrollment\n4.Teacher\n5.Payment\n6.Exit")
                choice = int(input("Enter the choice: "))
                if choice in range(1, 7):
                    if choice == 1:
                        while True:
                            print('''1.enroll  a new student\n2.Update student\n3.Get Student\n4.Delete Student\n5.Get all students\n6.Exit''')
                            choice_1 = int(input("Enter your Choice: "))
                            if choice_1 in range(1, 7):
                                if choice_1 == 1:
                                    student_service.Add_student()
                                elif choice_1 == 2:
                                    student_service.Update_student()
                                elif choice_1 == 3:
                                    student_service.Get_student()
                                elif choice_1 == 4:
                                    student_service.Delete_student()
                                elif choice_1 == 5:
                                    student_service.Get_all_students()
                                else:
                                    break
                            else:
                                raise InvalidDataException("Input should be between 1 and 6")
                    elif choice == 2:
                        while True:
                            print('''1.add course\n2.update course\n3.get course\n4.delete course\n5.get all courses\n6.Exit''')
                            choice_2 = int(input("Enter your Choice: "))
                            if choice_2 in range(1, 7):
                                if choice_2 == 1:
                                    course_service.Add_course()
                                elif choice_2 == 2:
                                    course_service.Update_course()
                                elif choice_2 == 3:
                                    course_service.Get_course()
                                elif choice_2 == 4:
                                    course_service.Delete_course()
                                elif choice_2 == 5:
                                    course_service.Get_all_courses()
                                else:
                                    break
                            else:
                                raise InvalidDataException("Input should be between 1 and 6")
                    elif choice == 3:
                        while True:
                            print('''1.add enrollments\n2.update enrollments\n3.get enrollments\n4.delete enrollments\n5.get all enrollments\n6.Exit''')
                            choice_3 = int(input("Enter your Choice: "))
                            if choice_3 in range(1, 7):
                                if choice_3 == 1:
                                    enrollment_service.Add_enrollment()
                                elif choice_3 == 2:
                                    enrollment_service.Update_enrollment()
                                elif choice_3 == 3:
                                    enrollment_service.Get_enrollment()
                                elif choice_3 == 4:
                                    enrollment_service.Delete_enrollment()
                                elif choice_3 == 5:
                                    enrollment_service.Get_all_enrollments()
                                else:
                                    break
                            else:
                                raise InvalidDataException("Input should be between 1 and 6")
                    elif choice == 4:
                        while True:
                            print('''1.add teacher\n2.Update teacher\n3.get teacher\n4.delete teacher\n5.get all teachers\n6.Exit''')
                            choice_4 = int(input("Enter your Choice: "))
                            if choice_4 in range(1, 7):
                                if choice_4 == 1:
                                    teacher_service.Add_teacher()
                                elif choice_4 == 2:
                                    teacher_service.Update_teacher()
                                elif choice_4 == 3:
                                    teacher_service.Get_teacher()
                                elif choice_4 == 4:
                                    teacher_service.Delete_teacher()
                                elif choice_4 == 5:
                                    teacher_service.Get_all_teachers()
                                else:
                                    break
                            else:
                                raise InvalidDataException("Input should be between 1 and 6")
                    elif choice == 5:
                        while True:
                            print('''1.add payment\n2.Update payment\n3.get payment\n4.delete payment\n5.get all payments\n6.Exit''')
                            choice_5 = int(input("Enter your Choice: "))
                            if choice_5 in range(1, 7):
                                if choice_5 == 1:
                                    payment_service.Add_payment()
                                elif choice_5 == 2:
                                    payment_service.Update_payment()
                                elif choice_5 == 3:
                                    payment_service.Get_payment()
                                elif choice_5 == 4:
                                    payment_service.Delete_payment()
                                elif choice_5 == 5:
                                    payment_service.Get_all_payments()
                                else:
                                    break
                            else:
                                raise InvalidDataException("Input should be between 1 and 6")
                    else:
                        exit()
            except Exception as e:
                print(f"An error occurred: {e}")
            finally:
                print("Thank You for reaching Student Information System...")



obj = Main()
obj.main()
