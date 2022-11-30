"model xử lý những hàm chung chung với db"
from flask import render_template, request, redirect, session, jsonify

from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db,app
from sqlalchemy import select, func

#
# def get_last_id_class():
#         p =  Class.query.order_by(Class.id.desc()).first()
#         return p.id


def get_last_id(table):
        p =  table.query.order_by(table.id.desc()).first()
        return p.id
# p = get_last_id(Class)
# print(p)
# #
# p = "nguyen quoc ky"
#
# print(p)
# with app.app_context():
#     c = get_last_id(Class)
#
# print(c)
# # if __name__ == '__main__':
#       with app.app_context():
#         c = get_last_id(Class)
#         print(c)
        # db.session.add(c)
        # session['class_id'] = c
        #
        # print(session['class'])
        # print(session.get(c))
        # # c2 = get_last_id_class()
        # print(c2)
#         print(type(Class)) # gét phân tu cuoi cung
