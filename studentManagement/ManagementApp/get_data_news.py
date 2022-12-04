# model nài dùng để thao tác dữ liệu tin tức


from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db, app
from sqlalchemy import select


from StudentManagement.studentManagement.ManagementApp import dao

def get_data_news():
    return News.query.all()



def get_news():# nó có bao gồm tên tác giả
    return News.query.join(User,News.id_author == User.id).add_columns(User.name).all()
    # return User.query.all()

def get_news_type(type,page = 1,kw  = None): #kw là từ khóa để tìm kiếm tin tức

    page_size = app.config['PAGE_SIZE']
    start = (page - 1) * page_size
    end = start + page_size
    list_news =  News.query.filter(News.type.__eq__(type)).join(User,News.id_author == User.id).add_columns(User.name)

    if kw:
        list_news = list_news.filter(News.header.contains(kw))


    return list_news.slice(start,end).all()

def get_count_type_news(type_news):
    return News.query.filter(News.type.__eq__(type_news)).count()


if __name__ == "__main__":
    with app.app_context():
       print(dao.get_last_id(Class))
