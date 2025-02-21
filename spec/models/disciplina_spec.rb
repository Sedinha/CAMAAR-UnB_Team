require 'rails_helper'

RSpec.describe Disciplina, type: :model do
  let(:departamento) { Departamento.create!(nome: "Departamento de Computação") }

  it "é valido com atributos válidos" do
    disciplina = Disciplina.new(nome: "Disciplina Teste", departamento: departamento)
    expect(disciplina).to be_valid
  end

  it "não é valido sem um nome" do
    disciplina = Disciplina.new(departamento: departamento)
    expect(disciplina).to_not be_valid
  end

  it "pertence a um departamento" do
    assoc = Disciplina.reflect_on_association(:departamento)
    expect(assoc.macro).to eq :belongs_to
  end

  it "possui muitas professor_disciplinas" do
    assoc = Disciplina.reflect_on_association(:professor_disciplinas)
    expect(assoc.macro).to eq :has_many
  end

  it "possui muitos professores através de professor_disciplinas" do
    assoc = Disciplina.reflect_on_association(:professores)
    expect(assoc.macro).to eq :has_many
  end

  it "possui muitas turmas" do
    assoc = Disciplina.reflect_on_association(:turmas)
    expect(assoc.macro).to eq :has_many
  end
end