class PagesController < ApplicationController

  def home
    if current_user

      redirect_to controller: 'videos', action: 'next'
    else

      login

    end
  end


  def login
    render "login", :layout => false
  end
end
