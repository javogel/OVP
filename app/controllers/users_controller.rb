class UsersController < ApplicationController

  def update_categories

    current_user.categories = Category.where(id: params[:categories])
  end



  def show
    
    @user = User.find(params[:id])
    @user_shared_videos = @user.videos

    @user_recommendations = @user.reactions.where("rating > ?", 0)

    @user_recommended_videos = Video.where(id: @user_recommendations.pluck(:video_id))
  end






end
