class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    p '**********'
    p @user.password
    if @user && @user.password == params[:session][:password]
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to admin_login_path
    end
  end

end
