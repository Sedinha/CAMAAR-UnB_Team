class QuestionariosController < ApplicationController
  before_action :authenticate_admin!, only: [ :new, :create ]

  def new
    @questionario = Questionario.new
    @templates = Template.all
    @turmas = Turma.all
  end

  def create
    @questionario = Questionario.new(questionario_params)
    if @questionario.save
      redirect_to questionarios_path, notice: "Questionário criado com sucesso."
    else
      render :new
    end
  end

  private

  def questionario_params
    params.require(:questionario).permit(:nome, :turma_id, :template_id)
  end
end
