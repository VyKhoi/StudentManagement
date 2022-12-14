import math

import flask_login
from flask import session
from unicodedata import name

from StudentManagement.studentManagement.ManagementApp import dao
from StudentManagement.studentManagement.ManagementApp import get_data_news
from StudentManagement.studentManagement.ManagementApp.management_database import *
from StudentManagement.studentManagement.ManagementApp.decorater import *
import cloudinary.uploader
from flask_login import login_user, login_required
import json
from StudentManagement.studentManagement.ManagementApp.handle_add_student.handle_students import *
from StudentManagement.studentManagement.ManagementApp.handle_add_student import semester_active
from StudentManagement.studentManagement.ManagementApp.handle_score import handle_score
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

            if check_age_student(birthday= birthday) == False:
                raise Exception('Tuổi không hợp lệ')


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


# render page chọn năm học
def choose_school_year():
    #  lay  3 id moi nhat
    list_year = semester_active.get_active_schol_year()
    print(list_year)
    return render_template('teacher/choose_school_year.html',list_year = list_year)




# cắt khối
def get_list_class_type(type,list_class):
    list_class_type = []
    for i in list_class:
       if i.Class.name_class.startswith(str(type)):
           list_class_type.append(i)

    return list_class_type

# trang nài sau khi bấm chọn học kỳ
def lms(id):
    # lấy đc year
    id_year = id
    print("id năm hoc lay dc la",id_year)
    # lấy tất cả lớp trong năm học nài
    list_class_in_year_semester = dao.get_teaching_class_user_semester(str(id_year),current_user.id)
    print(list_class_in_year_semester)
    # cắt ra 3 khối để bên kia render
    list_class_10 = get_list_class_type(10,list_class_in_year_semester)
    print("danh sách khoi 10",list_class_10)

    list_class_11 = get_list_class_type(11, list_class_in_year_semester)
    print(list_class_11)

    list_class_12 = get_list_class_type(12, list_class_in_year_semester)
    print(list_class_12)
    # bỏ nó vào web



    return render_template('teacher/handle-class.html',
                           list_class_10 = list_class_10,
                           list_class_11 = list_class_11,
                           list_class_12 = list_class_12,
                           id_year = id_year
                           )

# trang nhập điểm học sinh
def render_template_score(id_year,id_class,id_subject):

    print("id year nài là ", id_year)

    list_cell = handle_score.create_data_list_cell(id_year=id_year, id_class=id_class, id_subject=id_subject)
    lengt_list_cell = len(list_cell)


    list_student = handle_score.get_students_in_class(id_class= id_class, id_year= id_year)
    vt = 0


    # gửi cái danh sách vào session để sử dụng qua lại
    session['list_cell'] = handle_score.convert_list_cell_to_json(list_cell)
    # print(handle_score.handle_score())
    print("danh sach lisst cell ",session['list_cell'])

    class_name = Class.query.get(id_class)
    semester = School_Year.query.get(id_year)
    subject = Subjects.query.get(id_subject)

    # mình phãi truyền cái rule về môn học đó để nó biết rằng
    # môn học đó ràng buộc cột điểm
    print("mon hoc nay la",subject.name_subject)
    rule_subject = handle_score.rule_col_score_subject(subject.name_subject)
    print("dict rule subject",rule_subject)


    session['rule_subject'] = json.dumps(rule_subject)



    # lấy đối tuong ngừi dung hiện tại
    user =  flask_login.current_user


    return render_template('template_handle_score/import_score.html',
                           list_cell = list_cell,
                           lengt_list_cell = lengt_list_cell,
                           list_student = list_student,
                           vt = vt,
                           id_year = id_year,
                           id_subject =id_subject,
                            subject = subject,
                           class_name = class_name,
                           semester = semester,
                           user = user

                           ) #cái rule_subject sẽ đc truyền qua bên kia để nhận, mỗi khi nhập điểm
# nieus nhập sai thì cút

# xuất page xuất điểm
def page_table_average(id_class,id_subject,id_school_year):
    #  cần phãi lấy ra được id lớp, để lấy ra danh sách hs
    # lấy id class, id year, id sub
    print("có nhận :", id_class,id_subject,id_school_year)

    current_class  = Class.query.get(id_class)
    current_school_year = School_Year.query.get(id_school_year)
    current_subject = Subjects.query.get(id_subject)

    print("lớp là" , )

    list = []
    list_student = handle_score.get_students_in_class(id_class = id_class, id_year = id_school_year)
    for i in list_student:
        u = handle_score.get_infor_student_and_avg(student=i, id_subject = id_subject, id_school_year = id_school_year)
        list.append(u)


    return render_template('teacher/table-average.html',
                           list_student_avg = list,

                           current_class = current_class,
                           current_subject = current_subject,
                           current_school_year = current_school_year

                           )


# page xuất báo cáo giáo vụ
def stats_show():
    if request.method.__eq__('POST'):
        print("hello")
        year = request.form.get('school_year')

        # lấy đc năm bắt đầu và năm kết thúc
        years = list(year.split("-"))
        print(years)

        name_subject =  request.form.get('name_subjects')
        semester = request.form.get('semester')

        school_year = School_Year.query.filter(
            School_Year.year_start.__eq__(years[0]),
            School_Year.year_end.__eq__(years[1]),
            School_Year.semester.__eq__(semester)
        ).all()[0]


        subject = Subjects.query.filter(Subjects.name_subject.contains(name_subject)).all()[0]
        print(subject)

        print("school yea lay ra dc la", school_year)
        print("bao cao ", year, name_subject, semester)

        list_class = handle_score.rate_student_qualified_subject_in_class(id_school_year=school_year.id,id_subject=subject.id)
        print(list_class)

        name_list_class = []
        for i in list_class:
            name_list_class.append(i['name_class'])

        return render_template('handle_student/stats.html',
                           list_class = list_class,
                           school_year = school_year,
                           subject = subject,
                            name_list_class = name_list_class
                           )
    return render_template('handle_student/stats.html')
