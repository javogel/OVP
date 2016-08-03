class FollowsController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all
  end

  def create
    new_follow = current_user.following.new(user_id: params[:user_id_to_follow], follower_id: current_user.id)
    new_follow.save

    # render :nothing => true
  end


  def destroy
    follow_to_destroy = current_user.following
                        .where("user_id = ?", params[:user_id_to_follow])
                        .where("follower_id = ?", current_user.id)
    if follow_to_destroy[0]
      follow_to_destroy[0].destroy
    end

  # render :nothing => true
  end


end
