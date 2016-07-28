class UsersController < ApplicationController

  def update_categories
    user.categories = Category.where(id: params[:categories])
  end
end
