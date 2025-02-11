class UsersController < ApplicationController
  before_action :require_login, only: [ :index ]
  before_action :require_admin, only: [ :index ]

  def index
    @users = User.all
    @page_title = "Lista de Usuários"
  end
  def dashboard
    @page_title = "Dashboard do Usuário"
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if User.exists?(email: @user.email) || User.exists?(matricula: @user.matricula)
      flash.now[:alert] = "Email ou matrícula já cadastrados!"
      render :new
      return
    end

    if @user.email.end_with?("@prof.br")
      @user.role = "admin"
    else
      @user.role = "user"
    end
    if @user.save
      session[:user_id] = @user.id
      session[:user_type] = @user.role
      redirect_to user_dashboard_path, notice: "Usuário criado com sucesso!"
    else
      flash.now[:alert] = "Não foi possível criar o usuário!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :matricula, :email, :password, :password_confirmation, :role)
  end

  def require_admin
    if !current_user&.admin?
      flash[:alert] = "Acesso não autorizado."
      redirect_to root_path
    end
  end

  def require_login
    if !logged_in?
      flash[:alert] = "Você precisa estar logado para acessar esta página."
      redirect_to root_path
    end
  end

  def authenticate_user!
    redirect_to root_path unless session[:user_type] == "user"
  end
end
