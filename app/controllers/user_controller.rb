class UserController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @page_title = "Dashboard do Usuário"
  end

  def authenticate_user!
    redirect_to root_path unless session[:user_type] == "user"
  end
end
