function click_login(){
    // alert("xin chao")
    let log  = document.getElementById("bg_login_form");
    let form =  document.getElementById("main-wrapper");
    log.style.display = "block"
    form.style.display = "block"


    log.style.animationName = "fadeIN"
    form.style.animationName = "fadeIN"
}



let log  = document.getElementById("bg_login_form");

log.addEventListener('click',function(){
    let form =  document.getElementById("main-wrapper");

    log.style.animationName = "fadeOut"
    form.style.animationName = "fadeOut"

    setTimeout(() => {
        form.style.display = "none"
        log.style.display = "none"
    }, 500);
    
    // alert("co vao")
})