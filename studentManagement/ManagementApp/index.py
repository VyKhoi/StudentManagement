import math

import flask_login
from flask import Flask, url_for
from flask import render_template, request, redirect
from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db,app,dao,login,controllers
from StudentManagement.studentManagement.ManagementApp import get_data_news
from StudentManagement.studentManagement.ManagementApp.management_database import *
from flask_admin import *
from StudentManagement.studentManagement.ManagementApp.decorater import *
import cloudinary.uploader
from flask_login import login_user,logout_user,login_required

# trang chủ, + login
app.add_url_rule('/','main',controllers.main,methods = ['get', 'post'])

#trang đăng ký người dùng
app.add_url_rule('/register','',controllers.register_create_account,methods = ['get', 'post'])


@app.route('/admin/')
@login_required


@login.user_loader
def user_load(id):
    return dao.get_user_id(id)

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('main'))


@app.context_processor
def common_attribute():
    user  = flask_login.current_user
    return {
        'user': user

    }

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('request_page/404.html')

@app.errorhandler(401)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('request_page/401.html')


@app.errorhandler(500)
def page_not_found(e):
    # note that we set the 404 status explicitly
         return render_template('request_page/500.html')



# Giáo vụ.
# app.add_url_rule('/receive_students', 'receive_students', controllers.index_academic_staff_())


app.add_url_rule('/receive_students','index_academic_staff_show',controllers.index_academic_staff_show)
app.add_url_rule('/receive_students','index_academic_staff_post',controllers.add_student,methods = ['post'])
#
# @app.route('/receive_students', methods = ['post'])






if __name__ == '__main__':
    with app.app_context():
        # ne = get_data_news.get_data_news()
        # print(ne)

        u = flask_login.current_user

        print("hello", u)
        app.run(debug=True)