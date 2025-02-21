require 'rails_helper'

RSpec.describe Resposta, type: :model do
  let(:template) { Template.create!(nome: "Template Teste", semestre: "2022/1", publicoAlvo: "estudantes") }
  let(:disciplina) { Disciplina.create!(nome: "Disciplina Teste") }
  let(:turma) { Turma.create!(codigo: "123456", semestre: "2025-1", disciplina: disciplina) }
  let(:questionario) { Questionario.create!(nome: "Questionário Teste", turma: turma, template: template) }
  let(:question) { Question.create!(title: "Título da Questão", question_type: :radio, content: "Conteúdo da Questão", template: template) }

  it "is valid with valid attributes" do
    resposta = Resposta.new(valor: "Valor da Resposta", question: question, questionario: questionario)
    expect(resposta).to be_valid
  end

  it "is not valid without a valor" do
    resposta = Resposta.new(question: question, questionario: questionario)
    expect(resposta).to_not be_valid
  end

  it "is not valid without a question_id" do
    resposta = Resposta.new(valor: "Valor da Resposta", questionario: questionario)
    expect(resposta).to_not be_valid
  end
  
  it "is not valid without a questionario_id" do
    resposta = Resposta.new(valor: "Valor da Resposta", question: question)
    expect(resposta).to_not be_valid
  end

  it "belongs to a questionario" do
    assoc = Resposta.reflect_on_association(:questionario)
    expect(assoc.macro).to eq :belongs_to
  end

  it "belongs to a question" do
    assoc = Resposta.reflect_on_association(:question)
    expect(assoc.macro).to eq :belongs_to
  end
end