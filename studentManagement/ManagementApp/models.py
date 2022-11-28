from enum import Enum as UserEnum
from sqlalchemy import Column, Integer, String, Float, Text, Boolean, ForeignKey, Enum
from sqlalchemy.orm import relationship
from StudentManagement.studentManagement.ManagementApp import app, db


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
    email = Column(String(50), nullable=False)


class User(BaseModel):
    username = Column(String(50), nullable=False)
    password = Column(String(50), nullable=False)
    image = Column(String(50), nullable=False)
    active = Column(String(50), nullable=False)

    news = relationship('news', backref='User', lazy=True)
    teaching_class = relationship('teaching_class', backref='User', lazy=True)

    def __str__(self):
        return self.name


class State(db.Model):
    __tablename__ = 'status'
    state = Column(String(50), primary_key=True)
    student = relationship('student', backref='State', lazy=True)


class Student(BaseModel):
    __tablename__ = 'student'
    status = Column(String(50), ForeignKey(State.state), nullable=False)

    score = relationship('score', backref='Student', lazy=True)
    student_class_school_year = relationship('student_class_school_year', backref='Student', lazy=True)
    review = relationship('review', backref='Student', lazy=True)


class Class(db.Model):
    __tablename__ = 'class'
    id = Column(String(50), primary_key=True)
    name_class = Column(String(50), nullable=False)
    count = Column(Integer, nullable=False)
    teaching_class = relationship('teaching_class', backref='Class', lazy=True)
    student_class_school_year = relationship('student_class_school_year', backref='Class', lazy=True)


class Reviews(db.Model):
    __tablename__ = 'reviews'
    id = Column(String(50), primary_key=True)
    conduct = Column(String(30), nullable=False)
    comments = Column(String(100), nullable=False)

    id_student = Column(String(50), ForeignKey(Student.id), nullable=False)
    id_school_year = Column(String(50), ForeignKey('school_year.id'), nullable=False)


class Score(db.Model):
    __tablename__ = 'score'
    id = Column(String(50), primary_key=True)
    values = Column(Float, nullable=False)

    type_score = Column(String(50), ForeignKey('type_score.type'), nullable=False)

    id_subject = Column(String(50), ForeignKey('subjects.id'), nullable=False)
    id_school_year = Column(String(50), ForeignKey('school_year.id'), nullable=False)
    id_student = Column(String(50), ForeignKey('student.id'), nullable=False)


class Type_Score(db.Model):
    __tablename__ = 'type_score'
    type = Column(String(50), primary_key=True , nullable=False)
    scores = relationship('score', backref='Type_Score', lazy=True)



class Subjects(db.Model):
    __tablename__ = 'subjects'
    id = Column(String(50), primary_key=True)
    name_subject = Column(String(50), nullable=False)

    score = relationship('score', backref='Subjects', lazy=True)

    teaching_class = relationship('teaching_class', backref='Subjects', lazy=True)


class School_Year(db.Model):
    __tablename__ = 'school_year'
    id = Column(String(50), primary_key=True)
    name = Column(String(50), nullable=True)
    year_start = Column(String(30), nullable=False)
    year_end = Column(String(30), nullable=False)
    semester = Column(String(30), nullable=False)

    score = relationship('score', backref='School_Year', lazy=True)

    teaching_class = relationship('teaching_class', backref='School_Year', lazy=True)
    student_class_school_year = relationship('student_class_school_year', backref='School_Year', lazy=True)
    review = relationship('review', backref='School_Year', lazy=True)


class Teaching_Class(db.Model):
    __tablename__ = 'teaching_class'
    id = Column(String(50), primary_key=True)

    id_teacher = Column(String(50), ForeignKey(User.id), nullable=False)
    id_class = Column(String(50), ForeignKey(Class.id), nullable=False)
    id_school_year = Column(String(50), ForeignKey(School_Year.id), nullable=False)
    id_subject = Column(String(50), ForeignKey(Subjects.id), nullable=False)


class Student_Class_SchoolYear(db.Model):
    id = Column(String(50), primary_key=True)

    id_student = Column(String(50), ForeignKey(Student.id), nullable=False)
    id_class = Column(String(50), ForeignKey(Class.id), nullable=False)
    id_school_year = Column(String(50), ForeignKey(School_Year.id), nullable=False)


# class nài dùng để cấu trúc tin tức
class news(db.Model):
    __tablename__ = 'news'
    id = Column(String(30), primary_key=True, nullable=False)
    header = Column(String(1000), nullable=False)
    content = Column(String(7000), nullable=False)
    date_push = Column(String(50), nullable=False)
    image = Column(String(500), nullable=False)
    type = Column(String(50), nullable=False)
    id_author = Column(String(50), ForeignKey(User.id), nullable=False)


if __name__ == '__main__':
    with app.app_context():
        db.create_all()
