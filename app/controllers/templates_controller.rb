class TemplatesController < ApplicationController
  

  def dashboard
    @page_title = "Gerenciamento de templates"
  end
  
  def index
    @templates = Template.all  
  end

  def show
    @template = Template.find(params[:id])
  end
  

  
  def new
    @template = Template.new
  end


  def create
    @template = Template.new(template_params)

    if @template.save
      redirect_to templates_path, notice: 'Template criado com sucesso.'
    else
      render :new
    end
  end
  

  private

  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:nome, :semestre, :publicoAlvo)
  end
end