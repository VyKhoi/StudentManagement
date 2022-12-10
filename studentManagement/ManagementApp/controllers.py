import math

import flask_login
from flask import Flask, url_for
from flask import render_template, request, redirect
from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db,app,dao,login
from StudentManagement.studentManagement.ManagementApp import get_data_news
from StudentManagement.studentManagement.ManagementApp.management_database import *
from flask_admin import *
from StudentManagement.studentManagement.ManagementApp.decorater import *
import cloudinary.uploader
from flask_login import login_user,logout_user,login_required

# trang chủ + login
def main():
    password =""
    username = ""
    user= None

    # xử lý phân trang
    page_common_news = request.args.get("page_common", 1)
    page_culture_news  = request.args.get("page_culture", 1)

    # lấy tin tức chung (type = 1)
    news_common = get_data_news.get_news_type(1,int(page_common_news),kw=request.args.get('keyword'))
    # lấy tin tức văn hóa nghệ thuật (type = 2)
    news_culture = get_data_news.get_news_type(2,int(page_culture_news),kw=request.args.get('keyword'))

    # lấy số lượng tin tức chung
    count_common_news = get_data_news.get_count_type_news(1)
    # lấy số lượng tin tức văn hóa
    count_culture_news = get_data_news.get_count_type_news(2)

    #xử lý đăng nhập
    err_msg = "" #biến thông báo lỗi
    if request.method.__eq__('POST'):
        # xử lý dăng nhập
        password = request.form.get('password_login')
        username = request.form.get('username_login')


        try:
        # lấy user từ trong db ra làm user dăng nhập
            user = dao.check_login(username=username, password=password)
            print("kiem tra user", user)
            if user:
                print(user)
                login_user(user = user)
                print(user.role, "o day")
                # return redirect(url_for('main',user = user))
            else:
                err_msg = "Đăng nhập thất bại"
                print(err_msg)
        except Exception as ex:
            err_msg = ex

    user = flask_login.current_user
    print("nguoi dung hien tai",user)
    return render_template("index.html",
                           news_common=news_common,
                           news_culture=news_culture,
                           count_common_news=math.ceil(count_common_news / app.config['PAGE_SIZE']),
                           count_culture_news=math.ceil(count_culture_news / app.config['PAGE_SIZE']),
                           err_msg = err_msg, user = user)


# trang đăng ký người dùng hệ thống
@login_required
@check_permission_register
def register_create_account():
    print("co vao register")
    err_msg = ""
    if request.method.__eq__('POST'):
        name = request.form.get('name_user')
        print(name)

        identity = request.form.get('identity_user')
        print(identity)

        hometown = request.form.get('hometown_user')
        print(hometown)

        email = request.form.get('email_user')
        print(email)

        phone = request.form.get('phone_user')
        print(phone)

        birthday = request.form.get('birthday')
        print(birthday)

        gender = request.form.get('gender')
        print(type(gender),gender)


        username = request.form.get('username')
        print(username)

        password = request.form.get('password')
        print(password)


        role = request.form.getlist('option1')
        print(role)


        confirm_password = request.form.get('confirm_password')
        print(confirm_password.strip())

        # print(password.strip().__eq__(confirm_password.strip()))
        try:
            if password.strip().__eq__(confirm_password.strip()):
                print("tao moi user")

                avatar = request.files.get('avatar_user')
                avatar_url = ""

                if avatar:
                    res = cloudinary.uploader.upload(avatar)
                    avatar_url = res['secure_url']
                    print("link hinh anh la " ,avatar_url)
                else:
                    avatar = ""
                # tạo user và add vào databbase
                dao.add_user(name = name,
                    username=username ,
                    password=password,
                    identity = identity,
                    hometown =hometown,
                    email = email,
                    phone = phone,
                    birthday = birthday,
                    gender = gender,
                    image = avatar_url,


                    role =role)
                print("da them vao db")


                # tao role cho user

                success = True
                # return redirect(url_for('register_create_account',success = success))
                return render_template('register.html', success = success)
            else:
                # err_msg = "Mật khẩu không khớp"
                 print("Mật khẩu không khớp")
                 raise Exception("Mật khẩu không khớp")
        except Exception as ex:
            err_msg = ex
            print("hệ thống lỗi " , ex)


    return render_template('register.html', err_msg = err_msg)


#hiển thị trang mặc định của công tác giáo vụ
@login_required
@check_permission_register
def index_academic_staff_show():
         return render_template('handle_student/receive_students.html')



# xử lý thêm học sinh
@login_required
@check_permission_register
def add_student():
    name = request.form.get('name_student')
    print(name)

    identity = request.form.get('identity_student')
    print(identity)

    hometown = request.form.get('hometown_student')
    print(hometown)

    email = request.form.get('email_student')
    print(email)

    phone = request.form.get('phone_student')
    print(phone)

    birthday = request.form.get('birthday_student')
    print(birthday)

    gender = request.form.get('gender_student')
    print(type(gender), gender)

    status = request.form.get('option_class')
    print(status)


    # print(password.strip().__eq__(confirm_password.strip()))
    try:
            print("tao moi học sinh")

            # tạo student và add vào databbase
            dao.add_student(name=name,

                         identity=identity,
                         hometown=hometown,
                         email=email,
                         phone=phone,
                         birthday=birthday,
                         gender=gender,
                         status=status)
            print("da them vao db")

            # tao role cho user
            success = True


            return render_template('handle_student/receive_students.html', success=success)
    except Exception as ex:
        err_msg = ex
        print("hệ thống lỗi ", ex)


    return render_template('handle_student/receive_students.html', err_msg=err_msg)



