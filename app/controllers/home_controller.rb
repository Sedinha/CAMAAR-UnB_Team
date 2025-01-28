class HomeController < ApplicationController
  def index
  end

  def admin_login
    redirect_to admin_dashboard_path
  end

  def user_login
    redirect_to user_dashboard_path
  end
end
