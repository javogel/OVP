


$( document ).ready(function() {



    $('.card-header__follow').on('click', function (e) {

      sendUserFollow($(this).data()["id"]);

    });

});

var sendUserFollow = function(data){

    var user_id_to_follow = data
    console.log(user_id_to_follow)

    $.ajax({
       type: "POST",
       url: "/user/follow",
       data: { 'user_id': user_id_to_follow},
       success: function(data){
         updateFollows(user_id_to_follow,1);
         return false
       },
       error:function(data){
         updateFollows(user_id_to_follow,1);
         return false
       }
     })

};

var updateFollows= function(id, change){

  if($('#'+id + " " + ".card-header__follow").text() == "Follow"){
    $('#'+id + " " + ".card-header__follow").text("Unfollow")
  }else {
    $('#'+id + " " + ".card-header__follow").text("Follow")
  }
  current_followers = $('#'+id + " " + ".card-footer__followers span").text()
  console.log(parseInt(current_followers))
  new_followers = parseInt(current_followers) + change
  $('#'+id + " " + ".card-footer__followers span").text(String(new_followers))



}
