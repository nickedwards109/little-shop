class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.update_attributes(username: params[:user][:username].downcase)
    
    if @user.save
      flash[:user] = "Account Creation Successful!"
      redirect_to login_path
    else
      flash[:error] = "Unable to Create Account"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end