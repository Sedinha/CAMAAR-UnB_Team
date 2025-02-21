require 'rails_helper'

RSpec.describe ProfessorDisciplina, type: :model do
  let(:professor) { Professor.create!(nome: "Professor Teste", departamento: "Departamento de Computação", email: "professor@example.com") }
  let(:disciplina) { Disciplina.create!(nome: "Disciplina Teste") }

  it "é valido com atributos válidos" do
    professor_disciplina = ProfessorDisciplina.new(professor: professor, disciplina: disciplina)
    expect(professor_disciplina).to be_valid
  end

  it "não é valido sem um professor_id" do
    professor_disciplina = ProfessorDisciplina.new(disciplina: disciplina)
    expect(professor_disciplina).to_not be_valid
  end

  it "não é valido sem uma disciplina_id" do
    professor_disciplina = ProfessorDisciplina.new(professor: professor)
    expect(professor_disciplina).to_not be_valid
  end

  it "pertence a um professor" do
    assoc = ProfessorDisciplina.reflect_on_association(:professor)
    expect(assoc.macro).to eq :belongs_to
  end

  it "pertence a uma disciplina" do
    assoc = ProfessorDisciplina.reflect_on_association(:disciplina)
    expect(assoc.macro).to eq :belongs_to
  end
end