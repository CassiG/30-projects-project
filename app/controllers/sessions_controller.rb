class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    p '**********'
    p @user.password
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to admin_login_path
    end
  end

end
