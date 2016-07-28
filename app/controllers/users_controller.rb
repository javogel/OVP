class UsersController < ApplicationController

  def update_categories
    current_user.category_update(params[:categories])
  end
end
