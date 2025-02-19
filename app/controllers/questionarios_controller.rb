class QuestionariosController < ApplicationController
  before_action :authenticate_admin!, only: [ :new, :create ]

  def new
    @questionario = Questionario.new
    @templates = Template.all
    @turmas = Turma.all
    @publicos_alvo = [ "Doscentes", "Discentes" ]
  end

  def create
    @questionario = Questionario.new(questionario_params)
    if @questionario.save
      redirect_to questionarios_path, notice: "Questionário criado com sucesso."
    else
      render :new
    end
  end

  def index
    @questionarios = Questionario.joins(:turma).where(turmas: { id: current_user.matriculas.pluck(:turma_id) }).where.not(id: current_user.respondidos.pluck(:questionario_id))
  end

  def show
    @questionario = Questionario.find(params[:id])
    @respostas = Resposta.where(questionario_id: @questionario.id, user_id: current_user.id)
  end

  def new_response
    @questionario = Questionario.find(params[:id])
    # Initialize a new response object
    @resposta = Resposta.new
  end

  def results
    @questionario = Questionario.find(params[:id])
    @respostas = Resposta.where(questionario_id: @questionario.id)
  end

  private

  def questionario_params
    params.require(:questionario).permit(:nome, :turma_id, :template_id)
  end
end
