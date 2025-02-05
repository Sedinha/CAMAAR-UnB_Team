class TurmasController < ApplicationController
  before_action :set_turma, only: %i[show edit update destroy]

  def index
    @turmas = Turma.all
  end

  def show
    @turma = Turma.find(params[:id])
  end

  def new
    @turma = Turma.new
  end

  def create
    @turma = Turma.new(turma_params)
    if @turma.save
      redirect_to @turma, notice: "Turma criada com sucesso."
    else
      render :new
    end
  end

  def edit
    @turma = Turma.find(params[:id])
  end

  def update
    if @turma.update(turma_params)
      redirect_to @turma, notice: "Turma atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @turma.destroy
    redirect_to turmas_path, notice: "Turma excluída com sucesso."
  end

  private

  def set_turma
    @turma = Turma.find(params[:id])
  end

  def turma_params
    params.require(:turma).permit(:codigo, :semestre, :horario, :usuario, :codigo) #usuario é o professor e codigo é a disciplina
  end
end
