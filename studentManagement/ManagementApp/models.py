from enum import Enum as UserEnum
from sqlalchemy import Column, Integer, String, Float, Text, Boolean, ForeignKey, Enum
from sqlalchemy.orm import relationship, backref
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


    news = relationship('news', backref='Users', lazy=True)

    # role = relationship('role', secondary='user_role', lazy='subquery',
    #                     backref=backref('Users', lazy=True))

    def __str__(self):
        return self.name


# class nài dùng để cấu trúc tin tức


#
class role(db.Model):
    __tablename__='role'
    role = Column(String(50), primary_key=True, nullable=False)



class permission(db.Model):
    __tablename__ = 'permission'
    id = Column(String(50), primary_key=True, nullable=False)
    permission_name = Column(String(50), nullable=False)
    role = relationship('role', secondary='role_permission', lazy = 'subquery',
                        backref = backref('permissions', lazy=True))


role_permission = db.Table('role_permission',
    Column('role', String(50), ForeignKey(role.role), primary_key=True, nullable=False),
    Column('id_per', String(50), ForeignKey(permission.id), primary_key=True, nullable=False))

user_role = db.Table('user_role',
    Column('role', String(50), ForeignKey(role.role), primary_key=True, nullable=False),
    Column('id_user', String(50), ForeignKey(User.id), primary_key=True, nullable=False))





class news(db.Model):
    __tablename__='news'
    id = Column(String(50), primary_key=True, nullable=False)
    header = Column(String(1000), nullable = False)
    content = Column(String(7000), nullable = False)
    date_push =Column(String(50), nullable=False)
    image = Column(String(500), nullable=False)
    type =  Column(String(50), nullable=False)



    id_author = Column(String(50), ForeignKey(User.id), nullable=False)


if __name__ == '__main__':
    with app.app_context():
        db.create_all()














