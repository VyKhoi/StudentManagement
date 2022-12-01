# "model xử lý những hàm chung chung với db"
# from StudentManagement.studentManagement.ManagementApp import app
# from StudentManagement.studentManagement.ManagementApp.models import *
# import sys
#
# def str_to_class(classname):
#     return getattr(sys.modules[__name__], classname)
#
# def get_last_id(table):
#
#         cl = str_to_class(table)
#         p =  cl.query.order_by(cl.id.desc()).first()
#         return p.id
#
#
#
# if __name__ == '__main__':
#         with app.app_context():
#          print(get_last_id('Class'))
#          # print(str_to_class('Class'))
