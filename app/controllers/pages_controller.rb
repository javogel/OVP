class PagesController < ApplicationController

  def home
    if current_user
      render "home"
    else
      render "login"
    end
  end
end
