require 'rails_helper'

RSpec.describe Respondido, type: :model do
  let(:user) { User.create!(username: "user", matricula: "654321", email: "user@example.com", password: "password", password_confirmation: "password", role: :user) }
  let(:questionario) { Questionario.create!(nome: "Questionário Teste", publico_alvo:"estudantes", turma: Turma.create!(codigo: "123456", semestre: "2025-1", disciplina: Disciplina.create!(nome: "Disciplina Teste")), template: Template.create!(nome: "Template Teste", semestre: "2022/1", publicoAlvo: "estudantes")) }

  it "is valid with valid attributes" do
    respondido = Respondido.new(questionario: questionario, user: user)
    expect(respondido).to be_valid
  end

  it "is not valid without a questionario_id" do
    respondido = Respondido.new(user: user)
    expect(respondido).to_not be_valid
  end

  it "is not valid without a user_id" do
    respondido = Respondido.new(questionario: questionario)
    expect(respondido).to_not be_valid
  end

  it "belongs to a questionario" do
    assoc = Respondido.reflect_on_association(:questionario)
    expect(assoc.macro).to eq :belongs_to
  end

  it "belongs to a user" do
    assoc = Respondido.reflect_on_association(:user)
    expect(assoc.macro).to eq :belongs_to
  end
end