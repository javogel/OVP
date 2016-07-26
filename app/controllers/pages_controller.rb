class PagesController < ApplicationController

  def home
    if current_user
      while @video == nil
        @video = current_user.get_next_video
      end
      render "home"
    else
      render "login"
    end
  end
end
