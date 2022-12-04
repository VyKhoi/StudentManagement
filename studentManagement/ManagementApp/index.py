import math

from flask import Flask
from flask import render_template, request, redirect
from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db,app
from StudentManagement.studentManagement.ManagementApp import get_data_news
from StudentManagement.studentManagement.ManagementApp.management_database import *
from flask_admin import *
@app.route("/")
def main():
    # xử lý phân trang
    page_common_news = request.args.get("page_common", 1)
    page_culture_news  = request.args.get("page_culture", 1)

    

    # lấy tin tức chung (type = 1)
    news_common = get_data_news.get_news_type(1,int(page_common_news),kw=request.args.get('keyword'))
    # lấy tin tức văn hóa nghệ thuật (type = 2)
    news_culture = get_data_news.get_news_type(2,int(page_culture_news),kw=request.args.get('keyword'))


    # lấy số lượng tin tức chung
    count_common_news = get_data_news.get_count_type_news(1)
    # lấy số lượng tin tức văn hóa
    count_culture_news = get_data_news.get_count_type_news(2)


    return render_template("index.html",
                           news_common = news_common,
                           news_culture = news_culture,
                           count_common_news =math.ceil(count_common_news/app.config['PAGE_SIZE']),
                           count_culture_news= math.ceil(count_culture_news/app.config['PAGE_SIZE']))
@app.route('/teacher')
def test_page_handle_class():
    return render_template('teacher/handle-class.html')

# test page của giáo viên
# @app.route('/teacher')
# def testpage_teacher():
#     return render_template('teacher/index.html')

#trang đăng ký người dùng
@app.route('/register', methods = ['get', 'post'])
def register_create_account():
    return render_template('register.html')

if __name__ == '__main__':
    with app.app_context():
        # ne = get_data_news.get_data_news()
        # print(ne)
        app.run(debug=True)