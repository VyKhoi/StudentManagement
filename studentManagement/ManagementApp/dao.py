from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db,app


import hashlib

# ,hometown,birthday,phone,
#                    email,username, password,
#                    image,active):
def get_user(identity,id = None):
    if id:
        return User.query.get(id)
    if identity:
        return User.query.filter(User.identity.__eq__(identity)).first()
    
    return "404"

def add_user(name,username,password, **kwargs):
    # password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    print(kwargs.get('birthday'))
    print(password)
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


def check_login(username,password):
    if username and password:
        password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
        return User.query.filter(User.active.__eq__(1),User.username.__eq__(username.strip()),
                                 User.password.__eq__(password)).first()

def get_user_id(id):
    return User.query.get(id)


if __name__ == '__main__':
    with app.app_context():
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
        # db.session.commit()
        u = check_login('vykhoi','123')
        print(type(u))
        print(u.birthday)
        print(u.role[0].role)

        if 'c' == 'c':
            print("oke")

        # add_role_user('teacher','12345678')
