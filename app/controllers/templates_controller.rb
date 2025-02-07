class TemplatesController < ApplicationController
  

  def dashboard
    @page_title = "Gerenciamento de templates"
  end
  
  #Função para listar todos os templates na página das templates
  def index
    @templates = Template.all  
  end

  #Função para mostrar um template
  def show
    @template = Template.find(params[:id])
  end
  

  #Função para criar um novo template
  def new
    @template = Template.new
    1.times { @template.questions.build } #inicia o template com uma questão
  end

  def create
    @template = Template.new(template_params)

    if @template.save
      redirect_to templates_path, notice: 'Template criado com sucesso.'
    else
      render :new
    end
  end

  def edit 
    set_template
  end

  def update
    set_template
    if @template.update(template_params)
      redirect_to templates_path, notice: 'Template atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    set_template
    @template.destroy
    redirect_to templates_path, notice: 'Template deletado com sucesso.'
  end
  

  private

  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:nome, :semestre, :publicoAlvo, questions_attributes: [:id, :title, :question_type, :content, :_destroy])
  end
end