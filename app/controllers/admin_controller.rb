class AdminController < ApplicationController
  before_action :authenticate_admin!
  def dashboard
    @page_title = "Dashboard Administrativo"
  end

  def authenticate_admin!
    redirect_to root_path unless session[:user_type] == "admin"
  end

  def management
    @page_title = "Gerenciamento"
  end
end
