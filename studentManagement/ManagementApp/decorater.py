
import flask_login

from flask import redirect,render_template
from flask_login import logout_user, current_user


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

        # print("vai tro hien tai",flask_login.current_user.role.role)

        for i in flask_login.current_user.role:
            print("cac vai tro",i)
            # check role có permission đăng ký người dung ko, chỉ cần nó là giaos vụ
            if i.role in ['academic_staff','admin']:
                access = True

        print(access)
        if access == False:
            print("có chạy vô dây 401")
            return render_template('request_page/401.html')
        else:
             return f(*args,**kwargs)

    # decorated_register.__name__ = str(f)
    return decorated_register

def check_admin(f):
    print("nó có vào đây")

    print("kiểm tra role")
    access = False
    print(flask_login.current_user)

    if flask_login.current_user:
        for i in flask_login.current_user.role:
            print("cac vai tro", i)
            if i.role in ['admin']:
                access = True

        print(access)

    if access == False:
        print("có chạy vô dây 401")
        return redirect('page_not_found')
    else:
        return None

if __name__ == '__main__':


    print(flask_login.current_user)
