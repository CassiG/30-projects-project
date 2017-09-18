class UsersController < ApplicationController
  include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to posts_path
  end
end
