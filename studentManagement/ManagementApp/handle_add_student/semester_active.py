# lấy 3 học kỳ mới nhất
from sqlalchemy import desc
from StudentManagement.studentManagement.ManagementApp.models import *
def get_active_schol_year():
    # print()
    return School_Year.query.order_by(School_Year.id.desc()).limit(3).all()

if __name__ == '__main__':
    with app.app_context():
      print(get_active_schol_year())