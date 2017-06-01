class AuthenticateAdminController < ApplicationController
  before_action :authenticate_admin

  def authenticate_admin
    id = session[:user_id]
    user = User.find(id) if id

    if user.nil? || user.role != 'admin'
      render file: "public/404", layout: false, status: 404
    end
  end
end