import requests

from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db,app
from flask import session, jsonify,request
import json
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
@app.route('/api/add-class', methods=['get','post'])
def add_class():
    # import pdb
    # pdb.set_trace()
    student_json = request.json  #nhận json yêu cầu lấy studetn với id
    print("truoc khi convert", student_json, type(student_json))

    student = Student.query.get( int( student_json['id'] ))
    print("student lấy đc ",student,type(student))

    stu = convert_student_to_json(student)

    obj_student = json.dumps(stu) #chuyển sang json


    # print("student sau khi chuyesausang json",str( obj_stu)

    # print(type(obj_student))
    #
    return jsonify(obj_student)
    # print("hoc sinh con cac o day", student_json)
    # print(student_json['id'])
    #
    # student_id = json.loads(student_json['id'])
    #
    # print(type(student_id))
    #
    # student = Student.query.get(student_id)
    #
    # session['id_student_comment'] = student
    #
    # print("gia tri dang gui rong seesion ",session.get('id_student_comment'))
    # return

if __name__ == '__main__':
    with app.app_context():
        # student_none = get_id_student(13)
        # for i in student_none:
        #     print(i.name)
        print(get_id_student(13))
        print(add_class())
        # print(check_identity_uer('10012asd9'))
        # print(check_username('user:1cac'))
        # print(check_login('user:1','1232'))
        print(get_user(identity='100168'))
        # print()
        # u = get_user(1234)
        # # u.role = 'teacher'
        # list = ['teacher', 'school_manager', 'academic_staff']
        # r = Role.query.filter()
        #
        # u.role.append(r)
        #
        #
        # print(u.role)
        # db.session.add(u)
        # # db.session.commit()
        # u = check_login('vykhoi','123')
        # print(type(u))
        # print(u.birthday)
        # print(u.role[0].role)
        #
        # if 'c' == 'c':
        #     print("oke")

        # add_role_user('teacher','12345678')
