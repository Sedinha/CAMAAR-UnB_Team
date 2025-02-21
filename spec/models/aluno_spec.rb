require 'rails_helper'

RSpec.describe Aluno, type: :model do
  it "is valid with valid attributes" do
    aluno = Aluno.new(nome: "Aluno Teste", matricula: "654321", email: "aluno@example.com")
    expect(aluno).to be_valid
  end

  it "has many matriculas" do
    assoc = Aluno.reflect_on_association(:matriculas)
    expect(assoc.macro).to eq :has_many
  end

  it "has many turmas through matriculas" do
    assoc = Aluno.reflect_on_association(:turmas)
    expect(assoc.macro).to eq :has_many
  end

  it "has one user" do
    assoc = Aluno.reflect_on_association(:user)
    expect(assoc.macro).to eq :has_one
  end
end