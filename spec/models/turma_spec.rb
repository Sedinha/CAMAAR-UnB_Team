require 'rails_helper'

RSpec.describe Turma, type: :model do
  let(:professor) { Professor.create!(nome: "Professor Teste", departamento: "Departamento de Computação", email: "professor@example.com") }
  let(:disciplina) { Disciplina.create!(nome: "Disciplina Teste") }

  it "is valid with valid attributes" do
    turma = Turma.new(codigo: "123456", semestre: "2025-1", professor: professor, disciplina: disciplina)
    expect(turma).to be_valid
  end

  it "belongs to a professor" do
    assoc = Turma.reflect_on_association(:professor)
    expect(assoc.macro).to eq :belongs_to
  end

  it "belongs to a disciplina" do
    assoc = Turma.reflect_on_association(:disciplina)
    expect(assoc.macro).to eq :belongs_to
  end

  it "has many matriculas" do
    assoc = Turma.reflect_on_association(:matriculas)
    expect(assoc.macro).to eq :has_many
  end

  it "has many alunos through matriculas" do
    assoc = Turma.reflect_on_association(:alunos)
    expect(assoc.macro).to eq :has_many
  end

  it "has many questionarios" do
    assoc = Turma.reflect_on_association(:questionarios)
    expect(assoc.macro).to eq :has_many
  end
end