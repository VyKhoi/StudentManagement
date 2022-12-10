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