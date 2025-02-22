class SessionsController < ApplicationController
  def new
  end

  # Método para realizar o login do usuário utilizando a matrícula e senha
  def create
    user = User.find_by(matricula: params[:matricula])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Login realizado com sucesso!"
    else
      flash[:alert] = "Matrícula ou senha inválidos"
      render :new
    end
  end
  
  # Método para realizar o logout do usuário
  def destroy
    session[:user_type] = nil
    session[:user_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso !"
  end
end
