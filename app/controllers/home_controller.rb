class HomeController < ApplicationController
  # Método responsável pela autenticação (login) dos usuários
  # Este método é chamado quando um usuário submete o formulário de login
  def create
    # Busca um usuário pelo número de matrícula fornecido
    # Retorna nil se não encontrar nenhum usuário
    user = User.find_by(matricula: params[:matricula])
    # Validação inicial: verifica se os campos obrigatórios foram preenchidos

    if params[:matricula].blank? || params[:password].blank?
      # Se algum campo estiver em branco, redireciona com mensagem de erro
      flash.now[:alert] = "Matricula e senha são obrigatórios"
      redirect_to root_path, status: :unprocessable_entity
    # Verifica se:
    # 1. O usuário existe e é um admin (user&.admin?)
    # 2. A senha fornecida está correta (authenticate)
    elsif user&.admin? && user&.authenticate(params[:password])
      # Configuração da sessão para usuário administrador
      session[:user_id] = user.id
      session[:user_type] = "admin"
      # Redireciona admin para a página de criação de questionários
      redirect_to admin_management_path, notice: "Login efetuado com sucesso!"
    # Verifica se:
    # 1. O usuário existe e não é admin
    # 2. A senha fornecida está correta
    elsif user&.authenticate(params[:password])
      # Configuração da sessão para usuário comum
      session[:user_id] = user.id
      session[:user_type] = "user"
      # Redireciona usuário comum para seu dashboard
      redirect_to questionarios_path, notice: "Login efetuado com sucesso!"

    else
      # Se nenhuma das condições acima for atendida
      # (usuário não existe ou senha incorreta)
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
