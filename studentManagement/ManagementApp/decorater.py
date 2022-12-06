from functools import wraps
from flask_login import current_user
from flask import redirect
def check_loged(f):
    def decorated_loging(*args,**kwargs):
        if not current_user.is_authenticated:
            return redirect('/')
        return f(*args,**kwargs)

    return decorated_loging