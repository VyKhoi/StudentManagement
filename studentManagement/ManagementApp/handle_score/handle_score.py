import json
import string
from flask import render_template, request, redirect
from StudentManagement.studentManagement.ManagementApp.models import *
from flask import render_template, request, redirect, session, jsonify

_15M_RATIO = 1
_45M_RATIO = 2
_FiNAL_TEST   = 3




class cell_maxtrix_score():
    def __init__(self, id, list):
        self.id = id
        self.list = list
    def convert_list(self):
        print("điểm của",self.id)
        return ",".join(str(x) for x in self.list)

    def __str__(self):
        print(self.list)
        return self.id


# tajo cell, nài theo thể loại, id học sinh, danh sách
def get_score_belong_type(type,id_student, list): #list data điểm tất cả học sinh để nó lấy lọc
    # print("no co chay vao ham nai")
    list_tmp = []  # list nài dùng để luu danh sách điểm theo loại
    print('gia tri list cell theo type',list_tmp)
    for i in list:
        if i[5] == id_student and i[2] == type:
            list_tmp.append(float(i[1]))

    # lấy ra được danh sách điểm theo type 15m
    # print(list_tmp)
    # tạo id khởi tạo 1 cell matrix
    id = "{0}-{1}".format(id_student,type)
    # print(id)


    # tạo cell matrix
    cell = cell_maxtrix_score(id = id,list = list_tmp)
    # print(cell)


    return cell


# lay diem mon hoc cua mon subject lop trong nam hoc (def lấy điểm 1)
def get_score_tudent_in_class(id_year_hk, id_class, subject):

    print("gia tri duoc truyen de loc diem la",id_year_hk,id_class,subject)

    # scores = db.session.query(Score.id,
    #                           Score.values,
    #                           Score.type_score,
    #                           Score.id_subject,
    #                           Score.id_school_year,
    #                           Score.id_student
    #                          ) \
    #     .select_from(Student_Class_SchoolYear).join(
    #     Score, Score.id_student == Student_Class_SchoolYear.id_student and
    #            Score.id_school_year == Student_Class_SchoolYear.id_school_year
    # ).filter(Student_Class_SchoolYear.id_school_year == id_year_hk,
    #          Student_Class_SchoolYear.id_class == id_class,
    #          Score.id_subject == subject
    #          ).all()

    scores = db.session.query(Score.id,
                              Score.values,
                              Score.type_score,
                              Score.id_subject,
                              Score.id_school_year,
                              Score.id_student
                              ) \
        .select_from(Student_Class_SchoolYear).join(
        Score, Score.id_student == Student_Class_SchoolYear.id_student and
               Score.id_school_year == Student_Class_SchoolYear.id_school_year
    ).filter(
            Score.id_school_year.__eq__(id_year_hk),
             Student_Class_SchoolYear.id_class == id_class,
             Score.id_subject == subject
             ).all()
    # Student_Class_SchoolYear.id_school_year == id_year_hk,
    print("điểm- hs_lo_hk", scores)
    print()
    return scores

# lấy điểm của "1 học sinh " với " môn học, học kỳ"
def get_score_student(id_student, id_subject, id_school_year):
    return Score.query.filter(Score.id_student.__eq__(id_student),
                              Score.id_subject.__eq__(id_subject),
                              Score.id_school_year.__eq__(id_school_year)
                              ).all()


# tính điểm trung bình học sinh theo môn học, theo năm học
def get_average_subject_student(id_student, id_subject, id_school_year):
    list_score = get_score_student(id_student=id_student, id_subject= id_subject, id_school_year = id_school_year)
    print(list_score)
    # biến lưu điểm tổng
    avg_stu = 0

    for i in list_score:
        print(i.values," thể loại điểm là  ", i.type_score)

    for i in list_score:
        if i.type_score.__eq__('15m'):
            avg_stu = avg_stu + i.values * _15M_RATIO

        if i.type_score.__eq__('45m'):
            avg_stu = avg_stu + i.values *  _45M_RATIO

        if i.type_score.__eq__('final_test'):
            avg_stu = avg_stu + i.values * _FiNAL_TEST

    print("điểm tổng học  sinh là ", avg_stu)

    avg_stu = avg_stu / get_ratio_average_subject(id_subject)




    return  round(avg_stu,2)

# tạo cấu trúc dict lưu thông tin của học sinh và điểm trung bình ( để render lên page xuất điểm tb học kỳ)
def get_infor_student_and_avg(student, id_subject, id_school_year):
    avg = get_average_subject_student(id_student=student.id, id_subject=id_subject, id_school_year=id_school_year)
    # print("điểm trung binh của học sinh ",student.name, " là " , avg)
    return {
        "id" : student.id,
        "name" : student.name,
        'gender' : student.gender,
        'identity' : student.identity,
        'hometown' : student.hometown,
        'birthday' : student.birthday,
        'phone': student.phone,
        'email' : student.email,
        'avg' : avg
    }

def get_id_students_in_class(id_class,id_year):
    list = Student_Class_SchoolYear.query.filter(
        Student_Class_SchoolYear.id_class.__eq__(id_class),
        Student_Class_SchoolYear.id_school_year.__eq__(id_year)).all()
    list_id = []
    for i in list:
        list_id.append(i.id_student)

    return list_id


# đây là tạo danh sách full cell trên hệ thống
def create_data_list_cell(id_year,id_class,id_subject):

    list_cell = []

    #     đầu tiên lấy full điểm toàn hs của lớp đó
    list_score = get_score_tudent_in_class(id_year_hk= id_year,id_class=id_class,subject= id_subject)
    #     lấy danh sách id của hs trong cái lớp đo, năm học đó
    list_id_students = get_id_students_in_class(id_class= id_class, id_year= id_year)
    list_id_students.sort()

    # print(list_score)
    # print( type(list_id_students[0]))
    #
    # print(list_id_students)



    for i in list_id_students:
        list_cell.append(get_score_belong_type(type='15m',id_student= i,list= list_score))
        list_cell.append(get_score_belong_type(type='45m', id_student=i, list=list_score))
        list_cell.append(get_score_belong_type(type='final_test', id_student=i, list=list_score))


    # print(list_cell)
    return list_cell

# get full student trong lớp đó
def get_students_in_class(id_class,id_year):

    print("id class là ",id_class , " id year để lọc là ", id_year)

    list = Student_Class_SchoolYear.query.filter(
        Student_Class_SchoolYear.id_class.__eq__(id_class),
        Student_Class_SchoolYear.id_school_year.__eq__(id_year)).all()

    list_id = []

    for i in list:
        list_id.append(i.Student)

    list_id.sort(key=lambda  x: int(x.id) )
    return list_id

def convert_chain_score_to_list(chain_score):
        li = list(chain_score.split(","))
        list_score  = []
        for i in li:
            list_score.append(float(i))

        return list_score
def convert_list_cell_to_json(list_cell):
    list_json_cell = []
    for i in list_cell:
        id = i.id
        value = i.list

        cell = {
            'id' : id,
            'value':value
        }
        list_json_cell.append(cell)

    json_list_cell = json.dumps(list_json_cell)
    return json_list_cell
    # print(type(list_json_cell[0]['value'][0]))


# hàm này dùng để xóa điểm đã bị thay đổi
def get_score_on_type_subject_year(id_student,type,id_subject,id_year):
    print("co chay vo day(truc khi xoa)")
    print(Score.query.filter(Score.type_score.__eq__(type),
                             Score.id_subject.__eq__(id_subject),
                             Score.id_school_year.__eq__(id_year),
                             Score.id_student.__eq__(id_student)
                             ).all())

    Score.query.filter(Score.type_score.__eq__(type),
                              Score.id_subject.__eq__(id_subject),
                              Score.id_school_year.__eq__(id_year),
                              Score.id_student.__eq__(id_student)
                              ).delete()
    print("xau khi xoa")
    print(Score.query.filter(Score.type_score.__eq__(type),
                              Score.id_subject.__eq__(id_subject),
                              Score.id_school_year.__eq__(id_year),
                              Score.id_student.__eq__(id_student)
                              ).all())
    return ''


# hàm nài là dùng để xử lý việc nhập điểm của giáo viên
@app.route('/test/handle_score', methods = ['get','post'])
def handle_score():
    print("nó có vô đây từ bên js")

    # import  pdb
    # pdb.set_trace()

    # lúc nài nó dữ liệu json bên cell nó gửi vào trong requset.json
    if request.method.__eq__('POST'):
        json_cell = request.json
        print("in thằng json",json_cell)



        # chuyển nó sang cell
        id = str(json_cell.get('id'))
        # print(id)
        l = json_cell.get('value')
        # print(l)

        #=>>>>>>>>>>> mình đã lấy đc cel bị thay đổi
        cell = cell_maxtrix_score(id = id,list= l)
        # => cần lấy ra ma trận cũ để so sánh cell => quyết định thay đổi
        print("CELL MOI ",cell)
        m = list(cell.id.split("-"))
        print(m)


        # lấy học kỳ với môn học
        id_year = json_cell.get('id_year')
        id_subject = json_cell.get('id_subject')

        # xóa hết điểm ô cell
        get_score_on_type_subject_year(id_student= m[0],type=m[1],id_subject=id_subject, id_year=id_year)

        try:
            for i in  convert_chain_score_to_list(cell.list):
                # tạo 1 điểm
                score_st = Score()
                score_st.values = i
                score_st.type_score = m[1]
                score_st.id_subject = id_subject # gắn id subject sau
                score_st.id_school_year = id_year # gắn yeau sau
                score_st.id_student = m[0]


                print(type(score_st))
                # nhét điểm đó lại đb
                db.session.add(score_st)
                db.session.commit()
        except:
            print("lỗi khong thêm vào đc")
        #kiem tra diem
        # print("du lieu trong sesion",type(session['list_cell']))
        # list_cell_matrix = json.loads(session['list_cell'])
        #
        # print(list_cell_matrix)
        # print("danh sach cell tu json ",type(list_cell_matrix[0]),type(list_cell_matrix[0]['value'][0]))

        print("sesion bên hàm nài ", session['rule_subject'])
# -----------

    print("niếu ko là post nó đéo chạy")
    return jsonify(session['rule_subject'])


# xử lý nhập điểm ( tùy vào môn mà nó có bao nhiêu cột để nhập khác nhau )
# hàm nài lấy ra đc 1 diction các gia trị quy định

# hàm này dùng để lấy cái luật lệ quy đinh mỗi môn học
def rule_col_score_subject(name_subject):
        print("ten mon hoc",name_subject)
        print("the loai", type(name_subject))
        rule_subject_lisst = Rule.query.filter(Rule.name.endswith( str(name_subject).strip() ) ).all()

        print("danh sach rule dc lay ra ",rule_subject_lisst)
        _15m = None
        _45m = None
        _final_test = None
        for i in rule_subject_lisst:
            if '15m' in i.name:
                _15m = int(i.value)
            if '45m' in i.name:
                _45m = int(i.value)
            if 'final_test' in i.name:
                _final_test = int(i.value)

        return {
            '_15m' : _15m,
            '_45m' : _45m,
            '_final_test' : _final_test
        }

# ---------------------------------------------
def get_ratio_average_subject(id_subject):

    sub = Subjects.query.get(int(id_subject))

    rule = rule_col_score_subject(name_subject = sub.name_subject)

    ratio = 0
    print("luat le ",rule)
    for i in rule:
        if i.endswith('15m'):
            ratio = ratio + rule[i] * _15M_RATIO
        if i.endswith('45m'):
            ratio = ratio + rule[i] * _45M_RATIO
        if i.endswith('final_test'):
            ratio = ratio + rule[i] * _FiNAL_TEST

    print("he so chia la" , ratio)
    return ratio
# đây là phần tính toán điểm trung bình ( mỗi lần thống kê điểm môn học của từng học sinh) XUất bản điểm cuối năm
# ---------


def get_achivement_student(avg_semester,list_tmp_subjects):
    print("khi vao ham ", avg_semester)
    if avg_semester > 8:
        print("vào case 1")
        check = True
        for i in list_tmp_subjects:
            if i['avg'] < 6.5:
                check = False

        if check == True:
            return "Giỏi"

    if avg_semester > 6.5:
        print("vào case 2")
        check = True
        for i in list_tmp_subjects:
            if i['avg'] < 5:
                check = False

        if check == True:
            return "Khá"

    if avg_semester > 5:
        print("vào case 3")
        check = True
        for i in list_tmp_subjects:
            if i['avg'] < 3.5:
                check = False

        if check == True:
            return "Trung Bình"

    if avg_semester > 3.5:
        check = True
        for i in list_tmp_subjects:
            if i['avg'] < 2:
                check = False

        if check == True:
           return "Yếu"
        else:
           return "Kém"


#
# tính điểm trung bình 1 học kỳ của 1 học sinh
def get_info_semester_student(student,id_school_year):
    subject_learn = Subjects.query.filter(Subjects.name_subject.contains(10)).all()


    list_tmp_subjects = []
    for i in subject_learn:
         tmp = get_infor_student_and_avg(student = student,id_subject= i.id,id_school_year= id_school_year)
         list_tmp_subjects.append(tmp)

    avg_semester = 0
    achievement = None

    # tính và lấy được điểm tổng trung bình
    for i in list_tmp_subjects:
        print(i['avg'])
        avg_semester = avg_semester + i['avg']



    # tính toán xem xét học lực
    avg_semester = round(avg_semester / len(list_tmp_subjects), 2)
    #   ---
    achievement = get_achivement_student(avg_semester=avg_semester, list_tmp_subjects = list_tmp_subjects)



    print("diem trung binh hoc ky", avg_semester)

    return  {
        'id' : student.id,
        'name': student.name,
        'achievement' : achievement,
        'avg_semester' : avg_semester
    }

# def avg_year_subject(id_subject, id_student,start_year , end_):


if __name__ == '__main__':
    with app.app_context():
        print("hello")
        print("ddieerm trung binh hoc ky 1 hs soos 1 laf ",get_info_semester_student(Student.query.get(11),2))
        Student_Class_SchoolYear.query.filter(
            Student_Class_SchoolYear.id_student.__eq__(194)
            , Student_Class_SchoolYear.id_school_year.__eq__(2)
        ).delete()
        # print(get_ratio_average_subject(1))
        # print("điểm trung binh môn sinh 10 của hs 1 là" ,
        #       get_average_subject_student(id_student=1,id_subject=7,id_school_year=1))
        #
        #
        # #lấy hoc sinh trong lớp id 1
        #
        # print(get_students_in_class(1,1))

        # for i in scores:
        #     print(i.values," thể loại điểm là  ", i.type_score)

        # # lấy tất cả học sinh trong id year 1, môn 1, lớp 1
        # print("test học sinh",get_average_subject_student(id_student=1,id_subject=4,id_school_year=1))
        #
        #
        # l = []
        # list_student = get_students_in_class(id_class=1,id_year=1)
        # for i in list_student:
        #     u = get_infor_student_and_avg(student=i,id_subject=4,id_school_year=1)
        #     l.append(u)
        #     print(u['name']," diem trung ",u['avg'])
        #
        # print(l)