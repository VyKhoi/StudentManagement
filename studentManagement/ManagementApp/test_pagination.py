from StudentManagement.studentManagement.ManagementApp.models import *
def get_students_in_class(id_class, id_year):
    list = Student_Class_SchoolYear.query.filter(
        Student_Class_SchoolYear.id_class.__eq__(id_class),
        Student_Class_SchoolYear.id_school_year.__eq__(id_year)).all()

    list_id = []

    for i in list:
        list_id.append(i.Student)

    list_id.sort(key=lambda  x: int(x.id))
    return list_id
if __name__ == "__main__":
    with app.app_context():
        list_id = get_students_in_class(id_class =1, id_year =1)
        for x in list_id:
            print(x.id)
        print(get_students_in_class(id_class =1, id_year =1))
        app.run(debug=True)
# lấy học sinh trong cùng 1 lớp của 1 năm học nào đó