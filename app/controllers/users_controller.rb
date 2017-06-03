class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to login_path, notice: 'Account Creation Successful!'
    else
      flash[:notice] = 'Unable to Create Account'
      render :new
    end
  end

  def edit
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(session[:user_id])
    @user.update_attributes(user_params)
    
    if @user.save
      redirect_to dashboard_path, notice: 'Account Successfully Updated'
    else
      flash[:notice] = 'Account Unable to Update'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end