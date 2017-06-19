class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_by(username: params[:user][:username].downcase)

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      current_user = @user
      if current_user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    else
      redirect_to login_path, notice: 'Login Failed'
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Successfully Logged Out'
  end
end
