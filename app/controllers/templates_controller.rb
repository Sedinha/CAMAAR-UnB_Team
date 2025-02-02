require 'ostruct'

class TemplatesController < ApplicationController
  

  def dashboard
    @page_title = "Gerenciamento de templates"
  end
  
  def index
    @templates = [
      OpenStruct.new(id: 1, name: "Template 1", semester: "semestre"),
      OpenStruct.new(id: 2, name: "Template 2", semester: "semestre")
    ]
    
  end
  

  
  def new
    @template = Template.new
  end


  def create
    @template = Template.new(template_params)

    if @template.save
      redirect_to @template
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
