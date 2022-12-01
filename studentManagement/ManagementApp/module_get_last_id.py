import mysql.connector


connection = mysql.connector.connect(host='localhost',
                                         database='btl_3',
                                            user='root',
                                         password='123456')
try:

    print("có vào đây")
    # class
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM class")
    records = cursor.fetchall()
    last_id_class = records[0][0]
    # print(last_id_class)


    # news
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM news")
    records = cursor.fetchall()
    last_id_news = records[0][0]
    # print(last_id_news)

    # permission
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM permission")
    records = cursor.fetchall()
    last_id_permission = records[0][0]
    # print(last_id_permission)

    #reviews
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM reviews")
    records = cursor.fetchall()
    last_id_reviews = records[0][0]
    # print(last_id_reviews)

    #rule
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM rule")
    records = cursor.fetchall()
    last_id_rule = records[0][0]
    # print(last_id_rule)

    # rule_table
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM rules_table")
    records = cursor.fetchall()
    last_id_rule_table = records[0][0]
    # print(last_id_rule_table)

    # school_year
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM school_year")
    records = cursor.fetchall()
    last_id_school_year = records[0][0]
    # print(last_id_school_year)

    # score
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM score")
    records = cursor.fetchall()
    last_id_score = records[0][0]
    # print(last_id_score)

    # student
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM student")
    records = cursor.fetchall()
    last_id_student = records[0][0]
    # print(last_id_student)


    # student__class__school_year
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM student__class__school_year")
    records = cursor.fetchall()
    last_id_student_class__school_year = records[0][0]
    # print(last_id_student_class__school_year)

    # subjects
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM subjects")
    records = cursor.fetchall()
    last_id_subjects = records[0][0]
    # print(last_id_subjects)


    # teaching_class
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM teaching_class")
    records = cursor.fetchall()
    last_id_teaching_class = records[0][0]
    # print(last_id_teaching_class)

    # user
    cursor = connection.cursor()
    cursor.execute("SELECT MAX(Id) FROM user")
    records = cursor.fetchall()
    last_id_user = records[0][0]
    # print(last_id_user)

    # for row in records:
    #     print("Id = ", row[0], )
    #     print("Name = ", row[1])
    #     print("Price  = ", row[2])
    #     print("Purchase date  = ", row[3], "\n")


except mysql.connector.Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if  connection.is_connected():
        connection.close()
        cursor.close()
        print("MySQL connection is closed")