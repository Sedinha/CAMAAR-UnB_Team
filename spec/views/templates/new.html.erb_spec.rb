require 'rails_helper'

RSpec.describe "templates/new.html.erb", type: :view do
  before do
    assign(:template, Template.new)
    render
  end

  it "exibe o formulário para criação de um novo template" do
    expect(rendered).to have_selector("form")
  end

  it "tem um campo para 'nome' attribute" do
    expect(rendered).to have_field("Nome da Template")
  end

  it "tem um campo para 'semestre' attribute" do
    expect(rendered).to have_field("template[semestre]")
  end

  it "tem um campo para 'publicoAlvo' attribute" do
    expect(rendered).to have_field("template[publicoAlvo]")
  end

  it "tem uma seção para as questões" do
    expect(rendered).to have_content("Questões")
    expect(rendered).to have_selector("#questions")
  end

  it "tem um botão para adicionar novas questões" do
    expect(rendered).to have_button("Adicionar questão")
  end

  it "tem um botão de submit" do
    expect(rendered).to have_button("Criar")
  end
end