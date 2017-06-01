class AuthenticateUserController < ApplicationController
  before_action :authenticate_user

  def authenticate_user
    id = session[:user_id]
    user = User.find(id) if id

    if user.nil?
      render file: "public/404", layout: false, status: 404
    end
  end
end