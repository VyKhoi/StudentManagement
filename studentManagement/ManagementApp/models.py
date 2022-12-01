from sqlalchemy.orm import relationship, backref
from enum import Enum as UserEnum
from sqlalchemy import Column, Integer, String, Float, Text, Boolean, ForeignKey, Enum
from sqlalchemy.orm import relationship
from StudentManagement.studentManagement.ManagementApp import app, db,module_get_last_id
import re


class UserRole(UserEnum):
    User = 1
    Admin = 2


class BaseModel(db.Model):
    __abstract__ = True

    id = Column(String(50), primary_key=True)
    name = Column(String(50), nullable=False)
    gender = Column(Boolean, default=False)
    identity = Column(String(50), nullable=False)
    hometown = Column(String(50), nullable=False)
    birthday = Column(String(50), nullable=False)
    phone = Column(String(50), nullable=False)
    email = Column(String(50), nullable= True)


class User(BaseModel):
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_user)
    id = Column(String(50), primary_key=True, default=res)


    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    image = Column(String(50), nullable=False)
    active = Column(String(50), nullable=False)


    news = relationship('News', backref='User', lazy=True)
    teaching_class = relationship('Teaching_Class', backref='User', lazy=True)
    in_charge_class = relationship('Class', backref='User', lazy=True)

    def __str__(self):
        return self.name + " | mã số :" + self.id


class State(db.Model):
    __tablename__ = 'status'

    state = Column(String(50), primary_key=True)

    student = relationship('Student', backref='State', lazy=True)


class Student(BaseModel):
    __tablename__ = 'student'
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_student)
    id = Column(String(50), primary_key=True, default=res)

    status = Column(String(50), ForeignKey(State.state), nullable=False)
    score = relationship('Score', backref='Student', lazy=True)
    student_class_school_year = relationship('Student_Class_SchoolYear', backref='Student', lazy=True)
    review = relationship('Reviews', backref='Student', lazy=True)


class Class(db.Model):
    __tablename__ = 'class'
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                            module_get_last_id.last_id_class)
    id = Column(String(50), primary_key=True,  default= res)


    name_class = Column(String(50), nullable=False)


    teaching_class = relationship('Teaching_Class', backref='Class', lazy=True)
    student_class_school_year = relationship('Student_Class_SchoolYear', backref='Class', lazy=True)
    id_teacher_in_charge = Column(String(50), ForeignKey(User.id), nullable=False)
    id_school_year = Column(String(50), ForeignKey('school_year.id'), nullable=False)

class Reviews(db.Model):
    __tablename__ = 'reviews'

    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_reviews)
    id = Column(String(50), primary_key=True,default = res)

    conduct = Column(String(30), nullable=False)
    comments = Column(String(100), nullable=False)

    id_student = Column(String(50), ForeignKey(Student.id), nullable=False)
    id_school_year = Column(String(50), ForeignKey('school_year.id'), nullable=False)


class Score(db.Model):
    __tablename__ = 'score'
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_score)
    id = Column(String(50), primary_key=True,default = res)
    values = Column(Float, nullable=False)

    type_score = Column(String(50), ForeignKey('type_score.type'), nullable=False)
    id_subject = Column(String(50), ForeignKey('subjects.id'), nullable=False)
    id_school_year = Column(String(50), ForeignKey('school_year.id'), nullable=False)
    id_student = Column(String(50), ForeignKey('student.id'), nullable=False)


class Type_Score(db.Model):
    __tablename__ = 'type_score'
    type = Column(String(50), primary_key=True , nullable=False)

    scores = relationship('Score', backref='Type_Score', lazy=True)



class Subjects(db.Model):
    __tablename__ = 'subjects'

    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_subjects)
    id = Column(String(50), primary_key=True,default = res)
    name_subject = Column(String(50), nullable=False)

    score = relationship('Score', backref='Subjects', lazy=True)
    teaching_class = relationship('Teaching_Class', backref='Subjects', lazy=True)
    User = relationship('User', secondary='user_subject', lazy='subquery',
                        backref=backref('Subjects', lazy=True))





class School_Year(db.Model):
    __tablename__ = 'school_year'
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_school_year)
    id = Column(String(50), primary_key=True,default = res)
    name = Column(String(50), nullable=True)
    year_start = Column(String(30), nullable=False)
    year_end = Column(String(30), nullable=False)
    semester = Column(String(30), nullable=False)


    score = relationship('Score', backref='School_Year', lazy=True)
    teaching_class = relationship('Teaching_Class', backref='School_Year', lazy=True)
    student_class_school_year = relationship('Student_Class_SchoolYear', backref='School_Year', lazy=True)
    review = relationship('Reviews', backref='School_Year', lazy=True)
    class_in_year = relationship('Class', backref='School_Year', lazy=True)

    def __str__(self):
        return self.name + " : "+self.semester

class Teaching_Class(db.Model):
    __tablename__ = 'teaching_class'
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_teaching_class)
    id = Column(String(50), primary_key=True,default = res)

    id_teacher = Column(String(50), ForeignKey(User.id), nullable=False)
    id_class = Column(String(50), ForeignKey(Class.id), nullable=False)
    id_school_year = Column(String(50), ForeignKey(School_Year.id), nullable=False)
    id_subject = Column(String(50), ForeignKey(Subjects.id), nullable=False)


class Student_Class_SchoolYear(db.Model):
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_student_class__school_year)

    id = Column(String(50), primary_key=True,default = res)

    id_student = Column(String(50), ForeignKey(Student.id), nullable=False)
    id_class = Column(String(50), ForeignKey(Class.id), nullable=False)
    id_school_year = Column(String(50), ForeignKey(School_Year.id), nullable=False)


# class nài dùng để cấu trúc tin tức


#
class Role(db.Model):
    __tablename__='role'
    role = Column(String(50), primary_key=True, nullable=False)



class Permission(db.Model):
    __tablename__ = 'permission'
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_permission)
    id = Column(String(50), primary_key=True, nullable=False,default = res)

    permission_name = Column(String(50), nullable=False)
    role = relationship('Role', secondary='role_permission', lazy = 'subquery',
                        backref = backref('permissions', lazy=True))


role_permission = db.Table('role_permission',
    Column('role', String(50), ForeignKey(Role.role), primary_key=True, nullable=False),
    Column('id_per', String(50), ForeignKey(Permission.id), primary_key=True, nullable=False))

user_role = db.Table('user_role',
    Column('role', String(50), ForeignKey(Role.role), primary_key=True, nullable=False),
    Column('id_user', String(50), ForeignKey(User.id), primary_key=True, nullable=False))

user_subject = db.Table('user_subject',
    Column('id_user', String(50), ForeignKey(User.id), primary_key=True, nullable=False),
    Column('id_sub', String(50), ForeignKey(Subjects.id), primary_key=True, nullable=False))





class News(db.Model):
    __tablename__ = 'news'
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_news)
    id = Column(String(30), primary_key=True, nullable=False, default = res)
    header = Column(String(1000), nullable=False)
    content = Column(String(7000), nullable=False)
    date_push = Column(String(50), nullable=False)
    image = Column(String(500), nullable=False)
    type = Column(String(50), nullable=False)


    id_author = Column(String(50), ForeignKey(User.id), nullable=False)


# phần quy tắc
class RulesTable(db.Model):
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_rule_table)
    id = Column(String(50), primary_key=True, nullable=False,default = res)
    name = Column(String(50), nullable=False)
    Rule =  relationship('Rule', backref='RulesTable', lazy=True)


class Rule(db.Model):
    res = re.sub(r'[0-9]+$', lambda x: f"{str(int(x.group()) + 1).zfill(len(x.group()))}",
                 module_get_last_id.last_id_rule)
    id = Column(String(50), primary_key=True, nullable=False,default = res)
    name = Column(String(50), nullable=False)
    value = Column(String(50), nullable=False)
    id_rules_table = Column(String(50), ForeignKey(RulesTable.id), nullable=False)


if __name__ == '__main__':
    with app.app_context():
        db.create_all()
        # c = News.query.get('n:00001')
        # print(c.User.name)
        #khoi da commit