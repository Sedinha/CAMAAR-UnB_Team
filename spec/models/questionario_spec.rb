require 'rails_helper'

RSpec.describe Questionario, type: :model do
  let(:turma) { Turma.create!(codigo: "123456", semestre: "2025-1", disciplina: Disciplina.create!(nome: "Disciplina Teste")) }
  let(:template) { Template.create!(nome: "Template Teste", semestre: "2022/1", publicoAlvo: "estudantes") }

  it "é valido com atributos validos" do
    questionario = Questionario.new(nome: "Questionário Teste", turma: turma, template: template)
    expect(questionario).to be_valid
  end

  it "não é valido sem um nome" do
    questionario = Questionario.new(turma: turma, template: template)
    expect(questionario).to_not be_valid
  end

  it "não é valido sem um turma_id" do
    questionario = Questionario.new(nome: "Questionário Teste", template: template)
    expect(questionario).to_not be_valid
  end

  it "não é valido sem um template_id" do
    questionario = Questionario.new(nome: "Questionário Teste", turma: turma)
    expect(questionario).to_not be_valid
  end

  it "pertence a turma" do
    assoc = Questionario.reflect_on_association(:turma)
    expect(assoc.macro).to eq :belongs_to
  end

  it "pertence a template" do
    assoc = Questionario.reflect_on_association(:template)
    expect(assoc.macro).to eq :belongs_to
  end

  it "tem muitas respostas" do
    assoc = Questionario.reflect_on_association(:respostas)
    expect(assoc.macro).to eq :has_many
  end

  it "tem muitos respondidos" do
    assoc = Questionario.reflect_on_association(:respondidos)
    expect(assoc.macro).to eq :has_many
  end
end