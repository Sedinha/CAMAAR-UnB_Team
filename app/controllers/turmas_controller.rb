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
      redirect_to turmas_path, notice: "Turma criada com sucesso."
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

  def import_page
  end

  # importa os dados de turmas
  def import
    file = params[:file]

    if file.nil?
      redirect_to import_turmas_page_path, alert: "Nenhum arquivo selecionado."
      return
    end

    data = JSON.parse(file.read)

    data.each do |turma_data|
      # Encontra ou cria a Disciplina
      disciplina = Disciplina.find_or_initialize_by(codigo: turma_data["code"])

      # Se a disciplina foi inicializada (não encontrada), salva as informações
      if disciplina.new_record?
        disciplina.nome = turma_data["name"]
        disciplina.save!
      end

      # Encontra ou cria a Turma
      turma = Turma.find_or_initialize_by(
        codigo: turma_data["class"]["classCode"],
        semestre: turma_data["class"]["semester"]
      )

      # Atualiza os atributos (caso a turma já exista, isso garante que os dados fiquem consistentes)
      turma.horario = turma_data["class"]["time"]
      turma.disciplina = disciplina
      turma.save!
    end

    redirect_to import_turmas_page_path, notice: "Dados importados com sucesso!"
  end

  # importa os membros de turmas
  def import_members
    file = params[:file]

    if file.nil?
      redirect_to import_turmas_page_path, alert: "Nenhum arquivo selecionado."
      return
    end

    data = JSON.parse(file.read)

    data.each do |turma_data|
      turma = Turma.find_by(codigo: turma_data["classCode"], semestre: turma_data["semester"])

      if turma
        # Importar o professor
        professor_data = turma_data["docente"]
        professor = Professor.find_or_create_by(usuario: professor_data["usuario"]) do |p|
          p.nome = professor_data["nome"]
          p.departamento = professor_data["departamento"]
          p.formacao = professor_data["formacao"]
          p.email = professor_data["email"]
          p.ocupacao = professor_data["ocupacao"]
        end
        turma.update(professor: professor)

        # Importar os alunos
        turma_data["dicente"].each do |aluno_data|
          aluno = Aluno.find_or_create_by(matricula: aluno_data["matricula"]) do |a|
            a.nome = aluno_data["nome"]
            a.curso = aluno_data["curso"]
            a.usuario = aluno_data["usuario"]
            a.formacao = aluno_data["formacao"]
            a.ocupacao = aluno_data["ocupacao"]
            a.email = aluno_data["email"]
          end

          # Criar matrícula
          Matricula.find_or_create_by(aluno: aluno, turma: turma)
        end
      end
    end

    redirect_to import_turmas_page_path, notice: "Alunos e professores importados com sucesso!"
  end

  private

  def set_turma
    @turma = Turma.find(params[:id])
  end

  def turma_params
    params.require(:turma).permit(:codigo, :semestre, :horario, :usuario, :codigo) # usuario é o professor e codigo é a disciplina
  end
end

# rails g model Turma codigo semestre horario professor:references materia:references
# rails g model Professor nome departamento formacao usuario email ocupacao
# rails g model Aluno nome curso matricula usuario formacao ocupacao email
# rails g model Disciplina codigo nome
# rails g model Matricula aluno:references turma:references
# rails g model ProfessorDisciplina professor:references disciplina:references
