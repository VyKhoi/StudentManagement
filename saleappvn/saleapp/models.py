from enum import Enum as UserEnum
from sqlalchemy import Column, Integer, String, Float, Text, Boolean, ForeignKey, Enum
from sqlalchemy.orm import relationship
from sqlalchemy.testing import db


class UserRole(UserEnum):
    User = 1
    Admin = 2

class BaseModel(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(50), nullable=False)
    gender = Column(Boolean, default=False)
    hometown = Column(String(50), nullable=False)
    birthday = Column(String(50), nullable=False)
    phone = Column(String(50), nullable=False)
    email = Column(String(50), nullable=False)


class Class(db.Model):
    __tablename__='class'

    id_class = Column(String(30), primary_key=True, nullable=False)
    students = relationship('Student', backref='class', lazy=True)

    def __str__(self):
        return self.name

class Student(BaseModel):
    graduated_highschool = Column(Boolean, default=False)
    conduct = Column(String(20), nullable=False)
    class_id = Column(String(30), ForeignKey(Class.id_class), nullable=False)

class Teacher(BaseModel):
    __tablename__ ='teacher'
    classes = relationship('class', backref='teacher', lazy=True)

# class ListStudentGraduated12(db.Model):
#     __tablename__='list_student_graduated_12'
#     students = relationship('Student', backref='list_student_graduated_12')
# class ListStudentFail(db.Model):
#     __tablename__='list_student_fail'
#
#     students = relationship('Student', backref='list_student_fail')

class Subject(db.Model):
    __tablename__ ='subject'

    id_subject = Column(String(30), primary_key=True, nullable=False)
    name = Column(String(50), nullable=False)
    description = Column(Text)

class Score(db.Model):
    __tablename__='score'

    id_score = Column(Integer, primary_key=True, autoincrement=True)
    student_id = Column(Integer, ForeignKey(Student.id), autoincrement=True)
    value = Column(Float, nullable=False)
    type_value = Column(Integer, nullable=False)
    subject_id = Column(String(30), ForeignKey(Subject.id_subject), nullable=False)













