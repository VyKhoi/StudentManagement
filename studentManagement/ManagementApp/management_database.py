from StudentManagement.studentManagement.ManagementApp import db, app,admin
from StudentManagement.studentManagement.ManagementApp.models import *

from flask_admin.contrib.sqla import ModelView

# can_view_details = True
class ClassView(ModelView):
    can_view_details = True
    form_excluded_columns = ['teaching_class', 'student_class_school_year']

class UserView(ModelView):
    can_view_details = True
    form_excluded_columns = ['news', 'teaching_class','in_charge_class']


class StudentView(ModelView):
    can_view_details = True
    form_excluded_columns = ['score', 'student_class_school_year','review']


admin.add_view(ClassView(Class, db.session, name='Quản trị lớp'))
admin.add_view(UserView(User, db.session, name='Quản trị giáo viên'))
admin.add_view(StudentView(Student, db.session, name='Quản trị học sinh'))
if __name__ == '__main__':
    # print(dao.c)
    print("hello")