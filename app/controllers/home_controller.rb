class HomeController < ApplicationController
  def create
    user = User.find_by(matricula: params[:matricula])

    if params[:matricula].blank? || params[:password].blank?
      flash.now[:alert] = "Matricula e senha são obrigatórios"
      redirect_to root_path, status: :unprocessable_entity
    elsif user&.admin? && user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_type] = "admin"
      redirect_to admin_dashboard_path, notice: "Login efetuado com sucesso!"
    elsif user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_type] = "user"
      redirect_to user_dashboard_path, notice: "Login efetuado com sucesso!"
    else
      flash.now[:alert] = "Matricula ou senha inválidos"
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def admin_login
    redirect_to admin_dashboard_path
  end

  def user_login
    redirect_to user_dashboard_path
  end
end
