
import flask_login
from flask_login import current_user
from flask import redirect,render_template



def check_loged(f):
    def decorated_loging(*args,**kwargs):
        if not current_user.is_authenticated:
            return redirect('/')
        return f(*args,**kwargs)

    return decorated_loging

# đối với tùy loại role mà nó có thể sử dụng đăng ký đc người dùng
def check_permission_register(f):
    def decorated_register(*args,**kwargs):
        print("kiểm tra role")
        # lấy ra được danh sách role
        # print(flask_login.current_user.role)

        access = False

        for i in flask_login.current_user.role:
            # check role có permission đăng ký người dung ko, chỉ cần nó là giaos vụ
            if i.role in ['academic_staff','admin']:
                access = True

        print(access)
        if access == False:
            return render_template('request_page/401.html')
        else:
             return f(*args,**kwargs)

    # decorated_register.__name__ = str(f)
    return decorated_register

if __name__ == '__main__':


    print(flask_login.current_user)
