require 'ostruct'

class TemplatesController < ApplicationController
  
  
  def index
    @templates = [
      OpenStruct.new(id: 1, name: "Template de Exemplo 1", semester: "Descrição do template 1"),
      OpenStruct.new(id: 2, name: "Template de Exemplo 2", semester: "Descrição do template 2")
    ]
    
  end
  

  
  def new
    @template = Template.new
  end


  def create
    @template = Template.new(template_params)

    if @template.save
      redirect_to templates_path, notice: "Template was successfully created."
    else
      render :new
    end
  end
end

  private

  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(:name, :semester)
  end
