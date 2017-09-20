class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.password == params[:session][:password]
      session[:user_id] = @user.id
      redirect_to '/'
      p session
      p session[:user_id]
    else
      redirect_to admin_login_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
