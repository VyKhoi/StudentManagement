from enum import Enum as UserEnum
from sqlalchemy import Column, Integer, String, Float, Text, Boolean, ForeignKey, Enum
from sqlalchemy.orm import relationship
from StudentManagement.studentManagement.ManagementApp import app,db


from enum import Enum as UserEnum
from sqlalchemy import Column, Integer, String, Float, Text, Boolean, ForeignKey, Enum
from sqlalchemy.orm import relationship
from StudentManagement.studentManagement.ManagementApp import app,db



class UserRole(UserEnum):
    User = 1
    Admin = 2

class BaseModel(db.Model):
    __abstract__ = True

    id = Column(String(50), primary_key=True)
    name = Column(String(50), nullable=False)
    gender = Column(Boolean, default=False)
    hometown = Column(String(50), nullable=False)
    birthday = Column(String(50), nullable=False)
    phone = Column(String(50), nullable=False)
    email = Column(String(50), nullable=False)

class User(BaseModel):
    name = Column(String(50), nullable = False)
    username = Column(String(50), nullable = False)
    password = Column(String(50), nullable=False)
    image = Column(String(50), nullable=False)
    active = Column(String(50), nullable=False)

    news = relationship('news', backref='User', lazy=True)

    def __str__(self):
        return self.name

# class Class(db.Model):
#     __tablename__='class'
#
#     id_class = Column(String(50), primary_key=True, nullable=False)
#     name = Column(String(50), nullable = False)
#
#
#     def __str__(self):
#         return self.name
#
# class Student(BaseModel):
#     graduated_highschool = Column(Boolean, default=False)
#     conduct = Column(String(20), nullable=False)
#
# class Teacher(BaseModel):
#     __tablename__ ='teacher'
#     classes = relationship('class', backref='teacher', lazy=True)
#
# class Subject(db.Model):
#     __tablename__ ='subject'
#
#     id_subject = Column(String(30), primary_key=True, nullable=False)
#     name = Column(String(50), nullable=False)
#     description = Column(Text)
#
# class Score(db.Model):
#     __tablename__='score'
#
#     id_score = Column(Integer, primary_key=True, autoincrement=True)
#     student_id = Column(Integer, ForeignKey(Student.id), autoincrement=True)
#     value = Column(Float, nullable=False)
#     type_value = Column(Integer, nullable=False)
#     subject_id = Column(String(30), ForeignKey(Subject.id_subject), nullable=False)


# class nài dùng để cấu trúc tin tức
class news(db.Model):
    __tablename__='news'
    id = Column(String(30), primary_key=True, nullable=False)
    header = Column(String(1000), nullable = False)
    content = Column(String(7000), nullable = False)
    date_push =Column(String(50), nullable=False)
    image = Column(String(500), nullable=False)
    type =  Column(String(50), nullable=False)
    id_author = Column(String(50), ForeignKey(User.id), nullable=False)


if __name__ == '__main__':
    with app.app_context():
        db.create_all()














