class QuestionariosController < ApplicationController
  before_action :authenticate_admin!, only: [ :new, :create ]
  before_action :set_turma, only: [ :new, :create ]


  def new
    @questionario = Questionario.new
    @templates = Template.all
    @turmas = Turma.all
    @publicos_alvo = [ "Docentes", "Discentes" ]
  end

  def create
    @questionario = Questionario.new(questionario_params)
    if @questionario.save
      redirect_to questionarios_path(@questionario), notice: "Questionário criado com sucesso."
    else
      render :new
    end
  end

  def index
    if current_user.aluno
      @questionarios = Questionario.joins(:turma)
                                   .where(turmas: { id: current_user.aluno.matriculas.map(&:turma_id) })
                                   .where.not(id: current_user.respondidos.map(&:questionario_id))
    else
      @questionarios = Questionario.none
      flash[:alert] = "Aluno não encontrado para o usuário atual."
    end
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
    params.require(:questionario).permit(:nome, :turma_id, :template_id, :publico_alvo)
  end

  def set_turma
    @turma = Turma.find(params[:turma_id]) if params[:turma_id].present?
  end

  def set_questionario
    @questionario = Questionario.find(params[:id])
  end
end
