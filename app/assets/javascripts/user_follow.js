


$( document ).ready(function() {



    $('.card-header__follow').on('click', function (e) {
      sendUserFollow($(this).data()["id"], $(this).data()["type"]);
    });

});

var sendUserFollow = function(user_id_to_follow, follow_type){
    var follow_button = $('#'+user_id_to_follow + " " + ".card-header__follow")
    var change = 0
    var request_type = ""
    var url = ""

    if(follow_type == 'follow'){
      follow_button.text("Unfollow")
      follow_button.data()["type"] = "unfollow"
      follow_button.removeClass("follow")
      change = 1
      request_type = "POST"
      url = "/follows"
    }else {
      follow_button.text("Follow")
      follow_button.data()["type"] = "follow"
      follow_button.addClass("follow")
      change = -1
      request_type = "DELETE"
      url = "/follows/destroy"
    }


    $.ajax({
       type: request_type,
       url: url,
       data: { 'user_id_to_follow': user_id_to_follow},
       success: function(data){
         event.preventDefault();
         updateFollows(user_id_to_follow, change);
          return false;

       },
       error:function(data){

         return false;
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
