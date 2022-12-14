import requests

from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db,app
from flask import session, jsonify,request
import json
import datetime
import hashlib

# ,hometown,birthday,phone,
#                    email,username, password,
#                    image,active):
def get_user(identity,username = None,id = None):
    if id:
        return User.query.get(id)
    if identity:
        if User.query.filter(User.identity.__eq__(identity)).first():
            return False
        if Student.query.filter(Student.identity.__eq__(identity)).first():
            return False



    return None

def check_username(username = None):
    if username:
        return User.query.filter(User.username.__eq__(username)).first()
# def check_identity_uer(identity): # none la ko co trong db
#     return User.query.filter(User.identity.__eq__(identity)).first()

def add_user(name,username,password, **kwargs):
    # password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    print(kwargs.get('birthday'))
    print(password)
    if get_user(kwargs.get('identity')) == None:

        if check_username(username) != None:
            raise Exception("Tên đăng nhập đã tồn tại")


        user2 = User(name = name,
                    username = username,
                    password = password,


                 gender= bool(kwargs.get('gender')),
                 identity= kwargs.get('identity'),
                 hometown= kwargs.get('hometown'),
                 birthday= kwargs.get('birthday'),
                 phone= kwargs.get('phone'),
                 email= kwargs.get('email'),

                 image= kwargs.get('image'),
                 active= '1')



        for i in kwargs.get('role'):
            # print(i)
            r = Role.query.get(i)
            user2.role.append(r)
        print(user2)
        db.session.add(user2)
        db.session.commit()
    else:
        raise Exception("Chứng minh nhân dân bị trùng")


def check_username(username):
    return User.query.filter(User.username.__eq__(username)).first()


def check_login(username,password):

    if username and password:
        if check_username(username) == None:
            raise Exception("Tên đăng nhập không tồn tại")

        password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
        p =  User.query.filter(User.active.__eq__(1),User.username.__eq__(username.strip()),
                                 User.password.__eq__(password)).first()
        if p == None:
            raise Exception("Sai mật khẩu")
        return p

def get_user_id(id):
    return User.query.get(id)

def get_rule_age_student(id_rule):
    return Rule.query.get(id_rule)

def check_age_student(birthday):
    # láy year of bỉthday
    year_b = int(birthday[-4:])
    today = datetime.date.today()
    # get curent year
    current_year = today.year

    age = current_year - year_b

    # 1 max age, 2 min age
    check = True
    if age <= int(get_rule_age_student(1).value) and age >= int(get_rule_age_student(2).value):
        return True
    else:
        return False









def add_student(**kwargs):

    if get_user(kwargs.get('identity')) == None:

        student = Student(name=kwargs.get('name'),
                          identity=kwargs.get('identity'),
                          hometown=kwargs.get('hometown'),
                          email=kwargs.get('email'),
                          phone=kwargs.get('phone'),
                          birthday=kwargs.get('birthday'),
                          gender=bool(kwargs.get('gender')),
                          status = kwargs.get('status'))


        db.session.add(student)
        db.session.commit()
    else:
        raise Exception("Chứng minh nhân dân bị trùng")

def get_student_none(status):
    student_none = Student.query.filter(Student.status.__eq__(status)).all()

    list_id = []

    for i in student_none:
        list_id.append(i.id)
    return list_id

def get_id_student(status):
    student = Student.query.filter(Student.id.__eq__(status)).all()
    return student


def convert_student_to_json(student):
    return {
        'id' : student.id,
        'name' : student.name,
        'email': student.email,
        'birthday': student.birthday,
        'hometown': student.hometown
    }
#thêm học sinh vô lớp
@app.route('/api/add-class', methods=['get','post'])
def add_class():
    # import pdb
    # pdb.set_trace()
    student_json = request.json  #nhận json yêu cầu lấy studetn với id
    print("truoc khi convert", student_json, type(student_json))

    student = Student.query.get( int(student_json['id']) )

    stu = convert_student_to_json(student)

    obj_student = json.dumps(stu) #chuyển sang json

    return jsonify(obj_student)

@app.route('/api/delete-class', methods=['get','post'])
def delete_class():
    # import pdb
    # pdb.set_trace()
    student_json = request.json  #nhận json yêu cầu lấy studetn với id
    print("truoc khi convert", student_json, type(student_json))

    student = Student.query.get( int(student_json['id']) )

    stu = convert_student_to_json(student)

    obj_student = json.dumps(stu) #chuyển sang json

    return jsonify(obj_student)
#xóa học sinh trong lớp
# @app.route('/api/remove-class', methods=['get','post'])
# def remove_student_in_class():
#     # import pdb
#     # pdb.set_trace()
#     student_json = request.json  #nhận json yêu cầu lấy studetn với id
#
#     student = Student.query.get( int( student_json['id'] ))
#     print(type(student))
#
#     Student_Class_SchoolYear.query.filter(Student_Class_SchoolYear.id_student.__eq__(student),
#                                           Student_Class_SchoolYear.id_school_year
#
#                                           )

def get_id_school_year(start_year, end_year, name_semester):
    print("nsme dc truyen vo la", name_semester)
    id_school_year = School_Year.query.filter(School_Year.semester.__eq__(name_semester),
                                    School_Year.year_start.__eq__(start_year),
                                    School_Year.year_end.__eq__(end_year)).all()
    return id_school_year[0]

#lấy id lớp trong 1 học kì
def get_id_class_in_semeter(name_class, id_school_year):

    print("name class o day laf ",name_class, id_school_year )

    id_class = Class.query.filter(Class.name_class.__eq__(name_class),
                                        Class.id_school_year.__eq__(id_school_year)).all()

    print(id_class)


    return id_class[0]

#lấy id trong bảng student_class_school
def get_id_student_class_school_year(id_class, id_school_year):
    id_student_class_school_year = Student_Class_SchoolYear.query.filter(Student_Class_SchoolYear.id_class.__eq__(id_class),\
                                                                         Student_Class_SchoolYear.id_school_year.__eq__(id_school_year)).all()
    return id_student_class_school_year
def get_class_in_year_semester(id):
    return Class.query.filter(Class.id_school_year.__eq__(id)).all()

def get_teaching_class_user_semester(id, id_user):
    return Teaching_Class.query.filter(Teaching_Class.id_school_year.__eq__(id),
                                       Teaching_Class.id_teacher.__eq__(id_user)).all()
if __name__ == '__main__':
    with app.app_context():
        print("hello")
        # # student_none = get_id_student(13)
        # # for i in student_none:
        # #     print(i.name)
        # print(get_id_student(13))
        # print(add_class())
        # print
        # print(get_user(identity='100168'))
        #
        # print(check_age_student('18/12/2001'))
        # print(get_id_school_year('2020','2021', 'HK1').id)
        # print(get_id_class_in_semeter('10a1',1))
        # print(get_id_student_class_school_year(1,1))
