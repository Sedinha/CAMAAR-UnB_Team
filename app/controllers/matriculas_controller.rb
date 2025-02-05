class MatriculasController < ApplicationController
  before_action :set_matricula, only: %i[show edit update destroy]

  def index
    @matriculas = Matricula.all
  end

  def show
    @matricula = Matricula.find(params[:id])
  end

  def new
    @matricula = Matricula.new
  end

  def create
    @matricula = Matricula.new(matricula_params)
    if @matricula.save
      redirect_to @matricula
    else
      render :new
    end
  end

  def edit
    @matricula = Matricula.find(params[:id])
  end

  def update
    @matricula = Matricula.find(params[:id])
    if @matricula.update(matricula_params)
      redirect_to @matricula
    else
      render :edit
    end
  end

  def destroy
    @matricula = Matricula.find(params[:id])
    @matricula.destroy
    redirect_to matriculas_path
  end

  private

  def set_matricula
    @matricula = Matricula.find(params[:id])
  end

  def matricula_params
    params.require(:matricula).permit(:usuario, :codigo) # usuario é o aluno e codigo é a turma
  end
end
