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
//= require bootstrap-sprockets
//= require jquery.fitvids.js
//= require image-picker.js
//= require nprogress

//= require_tree .







// Progress bar configuration
NProgress.configure({
  showSpinner: true,
  ease: 'ease',
  speed: 500
});


$( document ).ready(function() {

progressBar();




    $(".category-image-picker").imagepicker({
      initialized: activateModalButton
    });

    $(".category-video-image-picker").imagepicker({
    });

    $('#category-button').on('click', function () {
      console.log("here!!!!");
      sendUserCategoriesUpdate();
      $('#myModal').modal('hide');
    });


    activateTooltips();

});

var activateTooltips = function() {
  $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
}


var activateModalButton = function(){

  $('.category-modal-nav').removeClass('button-disable');

}


var sendUserCategoriesUpdate = function(){

    var selected_categories = $('#category-select').val();


    $.ajax({
       type: "PATCH",
       url: "/users/categories/update_all",
       data: { 'categories': selected_categories},
       success: function(data){
        //  alert(data.id)
         return false
       },
       error:function(data){
         return false
       }
     })


};


var progressBar = function() {

  // Show the progress bar
    NProgress.start();

    // Increase randomly
    var interval = setInterval(function() { NProgress.inc(); }, 1000);

    // Trigger finish when page fully loaded
    jQuery(window).load(function () {
        clearInterval(interval);
        NProgress.done();
    });

    // Trigger bar when exiting the page
    jQuery(window).unload(function () {
        NProgress.start();
    });

}
