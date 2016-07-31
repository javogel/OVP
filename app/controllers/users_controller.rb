class UsersController < ApplicationController

  def update_categories

    current_user.categories = Category.where(id: params[:categories])
  end


  def next_video
    @video = current_user.get_next_video

    redirect_to controller: 'videos', action: 'show', id: @video.id
  end


  def show
    @user = User.find(params[:user_id])
    @user_shared_videos = @user.videos

    @user_recommendations = @user.reactions.where("rating > ?", 0)

    @user_recommended_videos = Video.where(id: @user_recommendations.pluck(:video_id))
  end



  def follow
    @users = User.all
  end

  def follow_add
  new_follow = current_user.following.new(user_id: params[:user_id_to_follow], follower_id: current_user.id)
  new_follow.save

  # render :nothing => true
  end


  def follow_remove
  follow_to_destroy = current_user.following
                      .where("user_id = ?", params[:user_id_to_follow])
                      .where("follower_id = ?", current_user.id)
  if follow_to_destroy[0]
    follow_to_destroy[0].destroy
  end

  # render :nothing => true
  end


end
