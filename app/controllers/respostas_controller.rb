# app/controllers/respostas_controller.rb
class RespostasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_questionario, only: [ :new, :create ]
  before_action :set_respondido, only: [ :create ]

  # GET /questionarios/:questionario_id/respostas/new
  def new
    @questions = @questionario.template.questions
    @resposta = Resposta.new
  end

  # POST /questionarios/:questionario_id/respostas
  def create
    @questions = @questionario.template.questions

    # Salvar as respostas para cada pergunta
    @questions.each do |question|
      resposta_params = params[:respostas][question.id.to_s]
      if resposta_params.present?
        Resposta.create!(
          questionario: @questionario,
          question: question,
          valor: resposta_params[:valor],
          respondido: @respondido
        )
      end
    end

    redirect_to questionario_path(@questionario), notice: "Respostas enviadas com sucesso!"
  end

  private

  def set_questionario
    @questionario = Questionario.find(params[:questionario_id])
  end

  def set_respondido
    # Cria um registro de "respondido" para marcar que o aluno respondeu ao questionário
    @respondido = Respondido.create!(
      questionario: @questionario,
      user: current_user
    )
  end
end
