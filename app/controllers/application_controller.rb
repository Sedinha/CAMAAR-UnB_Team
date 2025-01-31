class ApplicationController < ActionController::Base
  helper_method :current_user, :current_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def authenticate_user!
    redirect_to root_path unless current_user
  end

  def authenticate_admin!
    redirect_to root_path unless current_admin
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
