class PagesController < ApplicationController

  def home
    if current_user
      @video = current_user.get_next_video

      redirect_to controller: 'videos', action: 'show', id: @video.id
    else

      login

    end
  end


  def login
    render "login", :layout => false
  end
end
