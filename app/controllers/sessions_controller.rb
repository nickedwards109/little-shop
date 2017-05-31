class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to dashboard_path
    else
      flash[:error] = "Login Failed"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:login] = "Successfully Logged Out"
    redirect_to root_path
  end

  def dashboard
  end
end