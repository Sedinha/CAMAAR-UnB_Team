require 'rails_helper'

RSpec.describe "templates/index.html.erb", type: :view do
  before do
    assign(:templates, [
      Template.create!(nome: "Template 1", semestre: "2021/1", publicoAlvo: "Alunos"),
      Template.create!(nome: "Template 2", semestre: "2021/2", publicoAlvo: "Professores")
    ])
    render
  end
  describe "Index" do
    it "exibe todos os templates" do
      expect(rendered).to match /Template 1/
      expect(rendered).to match /2021\/1/
      
      expect(rendered).to match /Template 2/
      expect(rendered).to match /2021\/2/      
    end
  end

  describe "Links para editar e deletar" do
    it "possui um link para editar e deletar cada template" do
      Template.all.each do |template|
        expect(rendered).to have_link(href: edit_template_path(template))
        expect(rendered).to have_selector("a[href='#{template_path(template)}'][data-turbo-method='delete']")
      end
    end
  end

  describe "Link para criar um novo template" do
    it "possui um link para criar um novo template" do
      expect(rendered).to have_link(href: new_template_path)
    end
  end
end