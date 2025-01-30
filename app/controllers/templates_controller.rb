class TemplatesController < ApplicationController
  

  def templates
    @templates = [
      OpenStruct.new(id: 1, name: "Template de Exemplo 1", description: "Descrição do template 1"),
      OpenStruct.new(id: 2, name: "Template de Exemplo 2", description: "Descrição do template 2")
    ]
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
      redirect_to admin_dashboard_path, notice: "Template was successfully created."
    else
      render :new
    end
end

  private

  def template_params
    params.require(:template).permit(:name, :semester)
  end
