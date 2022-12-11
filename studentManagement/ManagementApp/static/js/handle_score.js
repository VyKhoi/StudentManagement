function isInt(n) {
    return Number(n) === n && n % 1 === 0;
}

function isFloat(n) {

    return Number(n) === n && n % 1 !== 0;
}


//check xem điểm nó nhập vào có đúng với luật hay không
function change_cell(cell, id_year, id_subject) {
    // let d = document.getElementById('')
    // d.

    cell.style.outline = 'none'
    cell.style.backgroundColor = 'white'

  


    let susscess = true

    fetch('/test/handle_score').then(function (res) {
        return res.json(res)
    }).then(function (data) {
        console.log("xuat dc data", data)

        rule = JSON.parse(data)
        console.log("json sau pare ", rule['_15m'])
        console.log(Object.keys(rule))
        // CELL
        //        lấy giá trị của cell
        let id_cell = cell.id
        let value = cell.value
        //        lấy số lượng điểm trong cell
        let amount = value.split(",").length
        console.log("số luongj điểm lúc nài dang có là", amount)
        // chặc id cell

        type_cell = id_cell.substring(parseInt(id_cell.indexOf("-") + 1))
        console.log("thể loai cell", type_cell)
        // ///

        //        mình lấy đc luật lệ của tk subject đó r,
        //         củng lấy đc số lượng điểm tong cell mới => xử lý ngoại lệ
        value_rule = rule[`_${type_cell}`]

        console.log('aaaaaaaaa', rule[`_${type_cell}`], value_rule)
        //  trường hợp sai
        if (amount > value_rule) {
           alert("nhập điểm không hợp lệ")
           cell.style.backgroundColor = 'red'
           return
        } 
        else // trường hợp điểm nhập hợp lý 
        {
            console.log("oKE NHÂP ĐC")
           
            try {
          
        
        
                console.log("aaaaaaaaaascascc")
                
        
                // ----
        
                let id = cell.id
                let value = cell.value
        
                if (value == "") {

//                cũ
                    return
                    cell.value = value
//

//                    mới
//                        cell.value = ""
                }
        
                console.log("xuat id va gia tri cua cell",id, value)


                value[value.leng - 1]
        
        
                var array = value.split(",")
                console.log(array)
        
                try {
        
        
        
                    for (i = 0; i < array.length; i++)
                        console.log("khoi dep cahi")
        
                    array = array.map(function (item) {
                        return parseFloat(item);
                    });
        
                    console.log("cai gia tri cua ô nè ",array)
        
                    //  kiem tra list diem co dung yeu cau ko
        
                    for (i = 0; i < array.length; i++) {
                        if (array[i] < 0 || array[i] > 10 || isNaN(array[i])) {
                            throw "Nhập điểm sai"
                        }
                    }
        
                    console.log("nhập điểm đúng")
                    cell.style.backgroundColor = 'white'
        
                } catch (error) {
        
                    // var a = document.getElementById(sa)
                    // a.
                    console.log("no vo loi nai ",error)
                    cell.style.backgroundColor = 'red'
        
                    return;
                }
        
        
        
                fetch("/test/handle_score", {
                    method: "post",
                    body: JSON.stringify({
                        "id": id,
                        "value": value,
                        "id_year": id_year,
                        'id_subject': id_subject
                    }),
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
        
            }
            catch(ex){
                console.log("no co chay vo day")
                alert(ex)
            }

        }

        //  rule[`_${type_cell}`] 
    })


    // trở về màu sắc cũ
    let id_stu = cell.id.split("-")
    console.log(id_stu)

    let student = document.getElementById(id_stu[0])
    console.log("student la ",student)
    student.style.backgroundColor = 'white'

}


//lắng nghe bất cứ sựu thay đổi nào của cell chúng ta sẽ gọi hàm bên py để xử lý nó
function change_cell2(cell, id_year, id_subject) {
    try {
        //phong thi nghiem
        // if( check_rule(cell) == false){
        //     throw "Điểm không đúng quy định"
        // }
        // console.log("xuat cai ham", check_rule(cell))
        
        // if( check_rule(cell) == false)
        // {
        //     console.log("á đù nó sai rồi")
        // }


        console.log("aaaaaaaaaascascc")
        

        // ----

        let id = cell.id
        let value = cell.value

        if (value == "") {
            value = '0'
            cell.value = value
        }

        console.log(id, value)
        value[value.leng - 1]


        var array = value.split(",")
        console.log(array)

        try {



            for (i = 0; i < array.length; i++)
                console.log("khoi dep cahi")

            array = array.map(function (item) {
                return parseFloat(item);
            });

            console.log(array)

            //  kiem tra list diem co dung yeu cau ko

            for (i = 0; i < array.length; i++) {
                if (array[i] < 0 || array[i] > 10 || isNaN(array[i])) {
                    throw "Nhập điểm sai"
                }
            }

            console.log("nhập điểm đúng")
            cell.style.backgroundColor = 'white'

        } catch (error) {

            // var a = document.getElementById(sa)
            // a.
            console.log("no vo loi nai ",error)
            cell.style.backgroundColor = 'red'

            return;
        }



        fetch("/test/handle_score", {
            method: "post",
            body: JSON.stringify({
                "id": id,
                "value": value,
                "id_year": id_year,
                'id_subject': id_subject
            }),
            headers: {
                'Content-Type': 'application/json'
            }
        })

    }
    catch(ex){
        console.log("no co chay vo day")
        alert(ex)
    }
}

function switch_school_year_teaching(year) {

}

function hightline_student(cell){

  
    
    let id_stu = cell.id.split("-")
    console.log(id_stu)

    let student = document.getElementById(id_stu[0])
    console.log("student la ",student)
    student.style.backgroundColor = '#affffd'
}



function auto(){
    list = document.getElementsByClassName('cell')
    console.log(list)


  
    for(i = 0 ; i < list.length ; i = i + 3)
    {
        console.log(list[i])
       let diem1 =  Math.floor(Math.random() * (10 - 5 + 1) + 5);
       let diem2 = Math.floor(Math.random() * (10 - 5 + 1) + 5);
       let diem3 =Math.floor(Math.random() * (10 - 5 + 1) + 5);
    
        valueee = `${diem1},${diem2},${diem3}`
        list[i].value = valueee

        let diem4 = Math.floor(Math.random() * (10 - 5 + 1) + 5);
        let diem5 = Math.floor(Math.random() * (10 - 5 + 1) + 5);

     
        valueee = `${diem4},${diem5}`
        list[i+1].value = valueee

        let diem6 = Math.floor(Math.random() * (10 - 5 + 1) + 5);
        valueee = `${diem6}`
        list[i+2].value = valueee
    }


}