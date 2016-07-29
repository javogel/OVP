class UsersController < ApplicationController

  def update_categories

    current_user.categories = Category.where(id: params[:categories])
  end


  def next_video
    @video = current_user.get_next_video

    redirect_to controller: 'videos', action: 'show', id: @video.id
  end
end
