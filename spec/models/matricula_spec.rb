require 'rails_helper'

RSpec.describe Matricula, type: :model do
  let(:aluno) { Aluno.create!(nome: "Aluno Teste", matricula: "654321", email: "aluno@example.com") }
  let(:disciplina) { Disciplina.create!(nome: "Disciplina Teste") }
  let(:turma) { Turma.create!(codigo: "123456", semestre: "2025-1", disciplina: disciplina) }

  it "é valido com atributos válidos" do
    matricula = Matricula.new(aluno: aluno, turma: turma)
    expect(matricula).to be_valid
  end

  it "não é valido sem um aluno_id" do
    matricula = Matricula.new(turma: turma)
    expect(matricula).to_not be_valid
  end

  it "não é valido sem uma turma_id" do
    matricula = Matricula.new(aluno: aluno)
    expect(matricula).to_not be_valid
  end

  it "pertence a um aluno" do
    assoc = Matricula.reflect_on_association(:aluno)
    expect(assoc.macro).to eq :belongs_to
  end

  it "pertence a uma turma" do
    assoc = Matricula.reflect_on_association(:turma)
    expect(assoc.macro).to eq :belongs_to
  end
end