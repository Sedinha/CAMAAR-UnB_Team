class DisciplinasController < ApplicationController
  before_action :set_disciplina, only: %i[show edit update destroy]
  # Actions disponíveis:
  # 1. index   - lista todas disciplinas
  # 2. show    - mostra uma disciplina específica
  # 3. new     - formulário para nova disciplina
  # 4. create  - salva nova disciplina
  # 5. edit    - formulário para editar
  # 6. update  - atualiza disciplina
  # 7. destroy - remove disciplina
  def index
    @disciplinas = Disciplina.all
  end

  def show
  end

  def new
    @disciplina = Disciplina.new
  end

  def create
    @disciplina = Disciplina.new(disciplina_params)
    if @disciplina.save
      redirect_to @disciplina, notice: "Disciplina criado com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @disciplina.update(disciplina_params)
      redirect_to @disciplina, notice: "Disciplina atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @disciplina.destroy
    redirect_to disciplinas_path, notice: "Disciplina excluído com sucesso."
  end

  private

  def set_disciplina
    @disciplina = Disciplina.find(params[:id])
  end
  # Parâmetros permitidos para criar/atualizar:
  def disciplina_params
    params.require(:disciplina).permit(:codigo, :nome)
  end
end
