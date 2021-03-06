class SessionsController < ApplicationController

  def create
    begin


      @user = User.from_omniauth(request.env['omniauth.auth'])

      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}! Click the logo for video recommendations."
    rescue
      flash[:success] = "Welcome, #{@user.name}! Click the logo for video recommendations."
      # flash[:warning] = "There was an error while trying to authenticate you..."
    end

      redirect_to root_path

  end


  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Have a great day. See you soon!'
    end
      redirect_to root_path
  end

end
