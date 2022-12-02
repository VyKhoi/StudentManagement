import json, os
from StudentManagement.studentManagement.ManagementApp import app, db
from StudentManagement.studentManagement.ManagementApp.models import *


def read_json(path):
    with open(path, "r") as f:
        return json.load(f)


def get_data_json(path_file):  # bắt đầu từ data
    return read_json(os.path.join(app.root_path, path_file))


# nạp student
def import_list_student(list):
    tmp_list = []
    for i in list:
        stu = Student(id=int(i['id']), name=i['name'], gender=i['gender'], identity=i['identity']
                      , hometown=i['hometown'], birthday=i['birthday'], phone=i['phone'],
                      email=i['email'], status=i['status'])
        tmp_list.append(stu)
    print(tmp_list)

    db.session.add_all(tmp_list)
    db.session.commit()


# nạp news
def import_list_news(list):
    tmp_list = []
    for i in list:
        stu = News(id=i['id'], header=i['header'], content=i['content'], date_push=i['date_push'],
                   image=i['image'], type=i['type'], id_author=i['id_author'])
        tmp_list.append(stu)
    print(tmp_list)

    db.session.add_all(tmp_list)
    db.session.commit()


# user
def import_list_user(list):
    tmp_list = []
    for i in list:
        stu = User(id=int(i['id']), name = i['name'], gender=i['gender'], identity=i['identity']
                   , hometown=i['hometown'], birthday=i['birthday'], phone=i['phone'],
                   email=i['email'],username=i['username'], password=i['password'],
                   image=i['image'], active=i['active'])
        tmp_list.append(stu)
    print(tmp_list)

    db.session.add_all(tmp_list)
    db.session.commit()

# status
def import_list_status(list):
    tmp_list = []
    for i in list:
        stu = State(state = i['state'])
        tmp_list.append(stu)
    print(tmp_list)

    db.session.add_all(tmp_list)
    db.session.commit()

# subject
def import_list_subject(list):
    tmp_list = []
    for i in list:
        stu = Subjects(id = i['id'], name_subject = i['name_subject'])
        tmp_list.append(stu)
    print(tmp_list)

    db.session.add_all(tmp_list)
    db.session.commit()


# class
def import_list_class(list):
    tmp_list = []
    for i in list:
        stu = Class(id = i['id'],name_class = i['name_class'],
                    id_teacher_in_charge = i['id_teacher_in_charge'],
                    id_school_year = i['id_school_year'])
        tmp_list.append(stu)
    print(tmp_list)

    db.session.add_all(tmp_list)
    db.session.commit()


# permission
def import_list_permission(list):
    tmp_list = []
    for i in list:
        stu = Permission(id = i['id'],permission_name = i['permission_name'])
        tmp_list.append(stu)
    print(tmp_list)

    db.session.add_all(tmp_list)
    db.session.commit()

# role
def import_list_role(list):
    tmp_list = []
    for i in list:
        stu = Role(role = i['role'])
        tmp_list.append(stu)
    print(tmp_list)

    db.session.add_all(tmp_list)
    db.session.commit()

# # role_permission
# def import_list_role_permission(list):
#     tmp_list = []
#     print(list)
#     for i in list:
#         stu = role_permission(role = i['role'], id_per = i['id_per'])
#         tmp_list.append(stu)
#     print(tmp_list)
#
#     db.session.add_all(tmp_list)
#     db.session.commit()
#


if __name__ == '__main__':
    with app.app_context():
        print("hello")
        import_list_user(get_data_json('data/user.json'))
        import_list_news(get_data_json('data/news.json'))

        import_list_status(get_data_json('data/status.json'))

        import_list_student(get_data_json('data/student.json'))

        import_list_subject(get_data_json('data/subject.json'))

        import_list_permission(get_data_json('data/permission.json'))
        import_list_role(get_data_json('data/role.json'))
        # import_list_role_permission(get_data_json('data/role_permission.json'))