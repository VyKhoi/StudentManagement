import mysql.connector


connection = mysql.connector.connect(host='localhost',
                                         database='btl_4',
                                            user='root',
                                         password='123456')
try:
    #  WHERE id_student is 1
    print("có vào đây")
    # class
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM score WHERE id_student = '1'"
                   )
    records = cursor.fetchall()

    print(print(records))


except mysql.connector.Error as e:
    print("Error reading data from MySQL table", e)
finally:
    if  connection.is_connected():
        connection.close()
        cursor.close()
        print("MySQL connection is closed")