//lấy id render thông tin để commet
function student_id(){
    var a =  document.getElementById("test-add-student").value
    event.preventDefault()


    fetch('/api/add-class', {
        method : 'post',
        body :JSON.stringify({
            'id' : a
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(function(res){
        return res.json(res)

    }).then(function(data){
        console.info("hàm bên kia trả về ",data)
         obj = JSON.parse(data)

         let name_student = document.getElementById('name-student-add')
         name_student.value = obj['name']

         let email_student = document.getElementById('email-student-add')
         email_student.value = obj['email']

         let birthday_student = document.getElementById('birthday-student-add')
         birthday_student.value = obj['birthday']

         let hometown_student = document.getElementById('hometown-student-add')
         hometown_student.value = obj['hometown']


    })
}

function add_student_to_current_class(id_school_year, id_class){
          let id_student = document.getElementById("test-add-student").value
           console.log(id_class,id_school_year,id_student)



            fetch('/add_student_current_class', {
                    method : 'post',
                    body :JSON.stringify({
                        'id_student' : id_student,
                        'id_class' : id_class,
                        'id_school_year' : id_school_year
                    }),
                    headers: {
                        'Content-Type': 'application/json'
                    }
    }).then((response) => response.json()).then((data) =>
    {
    });


}

function delete_student_id(){
    var a =  document.getElementById("test-delete-student").value
    event.preventDefault()


    fetch('/api/delete-class', {
        method : 'post',
        body :JSON.stringify({
            'id' : a
        }),
        headers: {
            'Content-Type': 'application/json'
        }
    }).then(function(res){
        return res.json(res)

    }).then(function(data){
        console.info("hàm bên kia trả về ",data)
         obj = JSON.parse(data)

         let name_student = document.getElementById('name-student')
         name_student.value = obj['name']

         let email_student = document.getElementById('email-student')
         email_student.value = obj['email']

         let birthday_student = document.getElementById('birthday-student')
         birthday_student.value = obj['birthday']

         let hometown_student = document.getElementById('hometown-student')
         hometown_student.value = obj['hometown']


    })
}

function delete_student_to_current_class(id_school_year, id_class){
          let id_student = document.getElementById("test-delete-student").value
           console.log(id_class,id_school_year,id_student)

            fetch('/delete_student_current_class', {
                    method : 'post',
                    body :JSON.stringify({
                        'id_student' : id_student,
                        'id_class' : id_class,
                        'id_school_year' : id_school_year
                    }),
                    headers: {
                        'Content-Type': 'application/json'
                    }
    }).then((response) => response.json()).then((data) =>
    {

    });


}
//function student_id_remove(){
//    var a =  document.getElementById("test-add-student").value
//    event.preventDefault()
//
//
//    fetch('/api/remove-class', {
//        method : 'post',
//        body :JSON.stringify({
//            'id' : a,
//            'id_school_year': id_school_year,
//            'id_class': id_class
//        }),
//        headers: {
//            'Content-Type': 'application/json'
//        }
//    }).then(function(res){
//        return res.json(res)
//
//    }).then(function(data){
//        console.info("hàm bên kia trả về ",data)
//         obj = JSON.parse(data)
//
//         let name_student = document.getElementById('name-student')
//         name_student.value = obj['name']
//
//         let email_student = document.getElementById('email-student')
//         email_student.value = obj['email']
//
//         let birthday_student = document.getElementById('birthday-student')
//         birthday_student.value = obj['birthday']
//
//         let hometown_student = document.getElementById('hometown-student')
//         hometown_student.value = obj['hometown']
//
//
//    })
//}