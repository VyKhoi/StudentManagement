from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from urllib.parse import quote
from flask_babelex import Babel
import cloudinary
from flask_admin import Admin, BaseView, expose
app = Flask(__name__)

# co so du lieu
app.secret_key = '4567890sdfghjklcvbnvb4567fg6yug'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:%s@localhost/btl_3?charset=utf8mb4' % quote('123456')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db = SQLAlchemy(app=app)

app.config['PAGE_SIZE'] = 3

admin = Admin(app=app, name='Trang quản trị', template_mode='bootstrap4')



# cloudinary.config(cloud_name = "dssijhrst", api_key = "979849377371891", api_secret ="3V_MpBv1G_D-gn1z5VJonRaVX-E")
# babel = Babel(app=app)
#
# @babel.Localeselector
# def load_locale():
#     return 'vi'
