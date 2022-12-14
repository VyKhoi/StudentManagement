from builtins import int

from StudentManagement.studentManagement.ManagementApp import db, app
from StudentManagement.studentManagement.ManagementApp.models import *
from flask_login import logout_user, current_user
from flask_admin.contrib.sqla import ModelView
import flask_login
from flask import render_template, request, redirect, url_for
from flask_admin import Admin, BaseView, expose, AdminIndexView




class ClassView(ModelView):
    can_view_details = True
    form_excluded_columns = ['teaching_class', 'student_class_school_year']

class UserView(ModelView):
    can_view_details = True
    form_excluded_columns = ['news', 'teaching_class','in_charge_class']


class StudentView(ModelView):
    can_view_details = True
    form_excluded_columns = ['score', 'student_class_school_year','review']

class Rule_view(ModelView):
    can_view_details = True
    form_excluded_columns = ['id_rules_table']
    # form_excluded_columns = ['score', 'student_class_school_year','review']

# admin.add_view(AuthenticatedModelView())
# if AuthenticatedModelView() is True:
#     print("oke true")







class AdminIndex(AdminIndexView):
    @expose('/')
    def index(self):
        access = False
        if  current_user.is_authenticated:
            if flask_login.current_user:
                for i in flask_login.current_user.role:
                    print("cac vai tro", i)
                    if i.role in ['admin']:
                        access = True
            if access == False:
                print("có chạy vô dây 401")
                return self.render('request_page/401.html')
            else:
                return self.render('admin/index.html')
        else:
            return self.render('request_page/401.html')


admin = Admin(app=app, name='Trang quản trị', template_mode='bootstrap4', index_view= AdminIndex())

admin.add_view(ClassView(Class, db.session, name='Quản trị lớp'))
admin.add_view(UserView(User, db.session, name='Quản trị giáo viên'))
admin.add_view(StudentView(Student, db.session, name='Quản trị học sinh'))
admin.add_view(Rule_view(Rule,db.session,name="Quy định nhà trường"))


if __name__ == '__main__':
    # print(dao.c)
    print("hello")