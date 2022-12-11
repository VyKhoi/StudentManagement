from flask import url_for
from flask import session
from StudentManagement.studentManagement.ManagementApp import dao,login,controllers
from StudentManagement.studentManagement.ManagementApp.management_database import *
from StudentManagement.studentManagement.ManagementApp.decorater import *
from StudentManagement.studentManagement.ManagementApp.handle_score import handle_score
from flask_login import logout_user,login_required

# trang chủ, + login
app.add_url_rule('/','main',controllers.main,methods = ['get', 'post'])

#trang đăng ký người dùng
app.add_url_rule('/register','',controllers.register_create_account,methods = ['get', 'post'])


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



if __name__ == '__main__':
    with app.app_context():

        u = flask_login.current_user
        print("hello", u)
        app.run(debug=True)