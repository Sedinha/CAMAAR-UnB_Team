class SessionsController < ApplicationController
  def create_user
    # Lógica de autenticação para user
    session[:user_type] = "user"
    redirect_to user_dashboard_path
  end

  def create_admin
    # Lógica de autenticação para admin
    session[:user_type] = "admin"
    redirect_to admin_dashboard_path
  end

  def destroy
    # Lógica de autenticação para user
    session[:user_type] = nil
    redirect_to root_path
  end
end
