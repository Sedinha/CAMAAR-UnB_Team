require 'rails_helper'

RSpec.describe Professor, type: :model do
  it "is valid with valid attributes" do
    professor = Professor.new(nome: "Professor Teste", departamento: "Departamento de Computação", email: "professor@example.com")
    expect(professor).to be_valid
  end

  it "has many professor_disciplinas" do
    assoc = Professor.reflect_on_association(:professor_disciplinas)
    expect(assoc.macro).to eq :has_many
  end

  it "has many disciplinas through professor_disciplinas" do
    assoc = Professor.reflect_on_association(:disciplinas)
    expect(assoc.macro).to eq :has_many
  end

  it "has many turmas" do
    assoc = Professor.reflect_on_association(:turmas)
    expect(assoc.macro).to eq :has_many
  end
end