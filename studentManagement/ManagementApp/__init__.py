from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from urllib.parse import quote
from flask_babelex import Babel
import cloudinary

app = Flask(__name__)

cloudinary.config(cloud_name = "dssijhrst", api_key = "979849377371891", api_secret ="3V_MpBv1G_D-gn1z5VJonRaVX-E")
babel = Babel(app=app)

@babel.Localeselector
def load_locale():
    return 'vi'
