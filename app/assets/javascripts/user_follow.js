


$( document ).ready(function() {



    $('.card-header__follow').on('click', function (e) {
      sendUserFollow($(this).data()["id"]);
    });

});

var sendUserFollow = function(data){

    var user_id_to_follow = data


    var follow_button = $('#'+user_id_to_follow + " " + ".card-header__follow")
    var change = 0
    var request_type = ""

    if(follow_button.text() == "Follow"){
      follow_button.text("Unfollow")
      change = 1
      var request_type = "POST"
    }else {
      follow_button.text("Follow")
      change = -1
      var request_type = "DELETE"
    }


    $.ajax({
       type: request_type,
       url: "/user/follow",
       data: { 'user_id_to_follow': user_id_to_follow},
       success: function(data){
         event.preventDefault();
         updateFollows(user_id_to_follow, change);
         
       },
       error:function(data){

         return false
       }
     })

};



var updateFollows= function(id, change){
  // DRY THIS. subtract for unfollow
  var follower_count = $('#'+id + " " + ".card-footer__followers span")
  current_followers = follower_count.text()

  new_followers = parseInt(current_followers) + change
  follower_count.text(String(new_followers))
}
