from StudentManagement.studentManagement.ManagementApp import db, app,admin,dao
from StudentManagement.studentManagement.ManagementApp.models import *

from flask_admin.contrib.sqla import ModelView

# can_view_details = True
class ClassView(ModelView):
    can_view_details = True
    form_excluded_columns = ['teaching_class', 'student_class_school_year']
admin.add_view(ClassView(Class, db.session, name='Quản trị lớp'))


if __name__ == '__main__':
    print(dao.c)