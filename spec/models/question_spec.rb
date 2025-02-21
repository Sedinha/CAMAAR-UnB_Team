require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:template) { Template.create!(nome: "Template Teste", semestre: "2022/1", publicoAlvo: "estudantes" ) }

  it "is valid with valid attributes" do
    question = Question.new(title: "Título da Questão", question_type: :radio, content: "Conteúdo da Questão", template: template)
    expect(question).to be_valid
  end

  it "belongs to a template" do
    assoc = Question.reflect_on_association(:template)
    expect(assoc.macro).to eq :belongs_to
  end

  it "has many respostas" do
    assoc = Question.reflect_on_association(:respostas)
    expect(assoc.macro).to eq :has_many
  end

  it "has many questao_options" do
    assoc = Question.reflect_on_association(:questao_options)
    expect(assoc.macro).to eq :has_many
  end

  it "is not valid without a title" do
    question = Question.new(question_type: :radio, content: "Conteúdo da Questão", template: template)
    expect(question).to_not be_valid
  end

  it "is not valid without a question_type" do
    question = Question.new(title: "Título da Questão", content: "Conteúdo da Questão", template: template)
    expect(question).to_not be_valid
  end

  it "is not valid without content" do
    question = Question.new(title: "Título da Questão", question_type: :radio, template: template)
    expect(question).to_not be_valid
  end
end