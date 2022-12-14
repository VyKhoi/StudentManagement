function name_class(){
    let list  = document.getElementsByClassName('name_class_avg').innerText
    list_name_class = []
    for(i = 0 ; i < list.length ; i++)
    {
       list_name_clas.push(i)
    }
//
//    console.log(list_name_clas)
//
}

function drawChartJs(l,m,stu_oke){

 const ctx = document.getElementById('myChart')



  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: l,
      datasets: [{
        label: 'Số lượng học sinh trong lớp',
        data: m,
        borderWidth: 1,
          backgroundColor:  '#ff7b7b'
      },{
      label: 'Số lượng đạt',
      data: stu_oke,
      backgroundColor: '#67d623',
    }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });

}