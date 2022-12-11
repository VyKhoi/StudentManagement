import math
from StudentManagement.studentManagement.ManagementApp import dao,login,controllers
from StudentManagement.studentManagement.ManagementApp.management_database import *
from StudentManagement.studentManagement.ManagementApp.decorater import *
from StudentManagement.studentManagement.ManagementApp.handle_score import handle_score
from flask_login import logout_user,login_required

from StudentManagement.studentManagement.ManagementApp.test_pagination import *
# trang chủ, + login
app.add_url_rule('/','main',controllers.main,methods = ['get', 'post'])

#trang đăng ký người dùng
app.add_url_rule('/register','',controllers.register_create_account,methods = ['get', 'post'])

app.config['PAGE_OF_STUDENT'] = 3

app.add_url_rule('/choose_school_year','choose_school_year',controllers.choose_school_year,methods = ['get', 'post'])
app.add_url_rule('/lms/<id>','lms',controllers.lms,methods = ['get', 'post'])

# @app.route('/admin')
# @login_required
# @check_admin
# def hello_admin():
#     return render_template('request_page/404.html')



@login.user_loader
def user_load(id):
    return dao.get_user_id(id)

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('main'))


@app.context_processor
def common_attribute():
    user  = flask_login.current_user
    return {
        'user': user

    }

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('request_page/404.html')

@app.errorhandler(401)
def page_not_access(e):
    # note that we set the 404 status explicitly
    return render_template('request_page/401.html')




# giáo viên vô lms
app.add_url_rule('/teacher','teacher',controllers.lms,methods = ['get', 'post'])
#



#trang nhập điểm
@app.route('/handle-class')
def page_table_class():
    return render_template('teacher/table-class.html',
                           pages=math.ceil(len(get_students_in_class(id_class=1, id_year=1))/app.config['PAGE_OF_STUDENT']))


#trang nhận xét và đánh giá
@app.route('/juge-comment')
def page_juge_class():
    return render_template('teacher/juge-comment.html')
@app.route('/fix-class', methods = ['get', 'post'])
def page_fix_class():

    print("vao page_fix_class")
    if request.method.__eq__('POST'):

        name_class = request.form.get('name_class').lower()
        name_school_year = request.form.get('name_school_year')
        semmester = request.form.get('semester')
        start_end_year = name_school_year.split("-")
        start = start_end_year[0]
        end = start_end_year[1]
        id_school_year = dao.get_id_school_year(start, end, semmester).id
        id_class = dao.get_id_class_in_semeter(name_class, id_school_year).id
        list_id_student_class_school_year = dao.get_id_student_class_school_year(id_class, id_school_year)


        print("co vao post fix,class")
        # list_id_student_class_school_year = search_student_in_class()
        # for i in list_id_student_class_school_year:
        #     print(i.Student)
        return render_template('teacher/fix-class.html',
                               list_id_student_class_school_year=list_id_student_class_school_year,
                               name_class=name_class,
                               name_school_year = name_school_year)

    return render_template('teacher/fix-class.html')
@app.errorhandler(500)
def page_not_found(e):
    # note that we set the 404 status explicitly
         return render_template('request_page/500.html')



# Giáo vụ.
# app.add_url_rule('/receive_students', 'receive_students', controllers.index_academic_staff_())


app.add_url_rule('/receive_students','index_academic_staff_show',controllers.index_academic_staff_show)
app.add_url_rule('/receive_students','index_academic_staff_post',controllers.add_student,methods = ['post'])

app.add_url_rule('/stats','stats_show',controllers.stats_show)

#
# @app.route('/receive_students', methods = ['post'])
app.add_url_rule('/table-average/<id_class>/<id_subject>/<id_school_year>','page_table_average',controllers.page_table_average,methods = ['get','post'])



#  chỗ nài để show học sinh trong cái lớp đó
# @app.route('/score/<id_year>/<id_class>/<id_subject>')
app.add_url_rule('/score/<id_year>/<id_class>/<id_subject>','render_template_score',controllers.render_template_score,methods = ['get', 'post'])

# @app.route('/search_student_in_class', methods=['post','get'])
# def search_student_in_class():
#         name_class = request.form.get('name_class').lower()
#         name_school_year =  request.form.get('name_school_year')
#         semmester = request.form.get('semester')
#         start_end_year = name_school_year.split("-")
#         start = start_end_year[0]
#         end = start_end_year[1]
#         id_school_year= dao.get_id_school_year(start,end,semmester).id
#         id_class = dao.get_id_class_in_semeter(name_class, id_school_year).id
#         list_id_student_class_school_year = dao.get_id_student_class_school_year(id_class,id_school_year)
#
#         return list_id_student_class_school_year

if __name__ == '__main__':
    with app.app_context():

        u = flask_login.current_user
        print("hello", u)
        app.run(debug=True)