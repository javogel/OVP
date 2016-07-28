class UsersController < ApplicationController

  def update_categories

    current_user.categories = Category.where(id: params[:categories])
  end
end
