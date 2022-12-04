
// check pass word
function confirm_pass_word(){
    let password = document.getElementById('password')
    let password_confirm = document.getElementById('confirm_password')

    console.log(password)
    console.log(password_confirm)

    
    if(password_confirm.value == password.value)
    {
        password_confirm.style.borderStyle = 'none'
        password_confirm.style.borderColor = 'rgb(147, 147, 147)'
    }else{
        password_confirm.style.borderStyle = 'solid'
        password_confirm.style.borderColor = 'red'

    }
}