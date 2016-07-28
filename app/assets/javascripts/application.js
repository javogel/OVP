// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require jquery.fitvids.js
//= require image-picker.js
//= require turbolinks
//= require_tree .




$( document ).ready(function() {

    $(".category-image-picker").imagepicker({


      initialized: activateModalButton


    });

    $('#category-button').on('click', function (e) {
      sendUserCategoriesUpdate();
      $('#myModal').modal('hide');
    });

});


var activateModalButton = function(){

  $('.category-modal-nav').removeClass('button-disable');

}


var sendUserCategoriesUpdate = function(){

    var selected_categories = $('#category-select').val();

    $.ajax({
       type: "POST",
       url: "/user/categories",
       data: { 'categories': selected_categories},
       success: function(data){
         alert(data.id)
         return false
       },
       error:function(data){
         return false
       }
     })


    //
    // $.ajax({
    //
    //     url : 'user/categories',
    //     type : 'GET',
    //     dataType:'json',
    //     success : function(data) {
    //         alert('Data: '+data);
    //     },
    //     error : function(request,error)
    //     {
    //         alert("Request: "+JSON.stringify(request));
    //     }
    // });
};
