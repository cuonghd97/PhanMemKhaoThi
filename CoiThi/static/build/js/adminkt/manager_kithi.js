$(document).ready(function() {
    $('#quanlykithi').DataTable( {
        "ajax": {
            "type": "GET",
            "url": "/adminkt/quan_ly_ki_thi_data",
            "contentType": "application/json; charset=utf-8",
            "data": function(result){
                return JSON.stringify(result);
            },
        },
        
        "displayLength": 10,
    });
});
// $('#create_kithi').on('click',function(){
//     $('#model_create_kithi').modal();
// });
// $("#new_teacher").on('click ', function(event){
//     var button = $(event.relatedTarget);
//     var title = button.data('title');
//     $("#detail_teacher_title").text("Chi tiết lớp "+title);
    
//     // table_teacher.ajax.url("/adminsc/manage_teacher/data_" + title).load();
// }); 
// $("#delete_kithi").on('click ', function(event){
//     // var button = $(event.relatedTarget);
//     // var title = button.data('title');
//     // $("#delete_kithi_title").text("Chi tiết lớp "+title);
//     // $("#delete_kithi").modal();
//     // table_teacher.ajax.url("/adminsc/manage_teacher/data_" + title).load();
// }); 