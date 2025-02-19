class ProfessorDisciplinasController < ApplicationController
  before_action :set_professor_disciplina, only: %i[show edit update destroy]

  def index
    @professor_disciplinas = ProfessorDisciplina.all
  end

  def show
  end

  def new
    @professor_disciplina = ProfessorDisciplina.new
  end

  def create
    @professor_disciplina = ProfessorDisciplina.new(professor_disciplina_params)
    if @professor_disciplina.save
      redirect_to @professor_disciplina, notice: "ProfessorDisciplina criado com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @professor_disciplina.update(professor_disciplina_params)
      redirect_to @professor_disciplina, notice: "ProfessorDisciplina atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @professor_disciplina.destroy
    redirect_to professor_disciplinas_path, notice: "ProfessorDisciplina excluído com sucesso."
  end

  private

  def set_professor_disciplina
    @professor_disciplina = ProfessorDisciplina.find(params[:id])
  end

  def professor_disciplina_params
    params.require(:professor_disciplina).permit(:usuario, :codigo) #usuario é o professor e codigo é a disciplina
  end
end
