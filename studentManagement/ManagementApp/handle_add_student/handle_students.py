from StudentManagement.studentManagement.ManagementApp.models import *
def max_age_student():
    return Rule.query.get(1).value
def min_age_student():
    return Rule.query.get(2).value

def check_age_student(birthday):

    print("nó vào hàm")
    print(birthday)
    li = list(birthday.split("-"))
    print(li)
    #  lấy tuổi của học sinh

    year_b = int(li[0])
    print(year_b)
    # lấy current year
    from datetime import date

    current_year = date.today().year
    print(current_year)

    max_age = int(max_age_student())
    min_age = int(min_age_student())

    print("địt mẹ age",type(max_age))
    age = current_year - year_b

    print(age)
    if age < min_age or age > max_age:
        return False
    else:
        return True


if __name__ == '__main__':
    with app.app_context():
     check_age_student('18/12/2002')