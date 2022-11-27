# model nài dùng để thao tác dữ liệu tin tức


from StudentManagement.studentManagement.ManagementApp.models import *
from StudentManagement.studentManagement.ManagementApp import db
from sqlalchemy import select

def get_data_news():
    return news.query.all()



def get_news():# nó có bao gồm tên tác giả
    return news.query.join(User,news.id_author == User.id).add_columns(User.name).all()
    # return User.query.all()

def get_news_type(type,page = 1,kw  = None): #kw là từ khóa để tìm kiếm tin tức

    page_size = app.config['PAGE_SIZE']
    start = (page - 1) * page_size
    end = start + page_size
    list_news =  news.query.filter(news.type.__eq__(type)).join(User,news.id_author == User.id).add_columns(User.name)

    if kw:
        list_news = list_news.filter(news.header.contains(kw))


    return list_news.slice(start,end).all()

def get_count_type_news(type_news):
    return news.query.filter(news.type.__eq__(type_news)).count()


if __name__ == "__main__":
    with app.app_context():
        # print(get_data_news())
        #
        # print(get_news())
        #
        i = get_count_type_news(1)
        n = news(id = "3" , header = "ban tin buoi sang")


        print(i)
        print(n)
        # for i in get_news():
        #     print(i)
        print(get_news_type(1))
