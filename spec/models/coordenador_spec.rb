require 'rails_helper'

RSpec.describe Coordenador, type: :model do
  let(:user) { User.create!(username: "user", matricula: "654321", email: "user@example.com", password: "password", password_confirmation: "password", role: :user) }
  let(:departamento) { Departamento.create!(nome: "Departamento de Computação") }

  it "é válido com atributos válidos" do
    coordenador = Coordenador.new(user: user, departamento: departamento)
    expect(coordenador).to be_valid
  end

  it "não é válido sem um user_id" do
    coordenador = Coordenador.new(departamento: departamento)
    expect(coordenador).to_not be_valid
  end

  it "não é válido sem um departamento_id" do
    coordenador = Coordenador.new(user: user)
    expect(coordenador).to_not be_valid
  end

  it "pertence a um user" do
    assoc = Coordenador.reflect_on_association(:user)
    expect(assoc.macro).to eq :belongs_to
  end

  it "pertence a um departamento" do
    assoc = Coordenador.reflect_on_association(:departamento)
    expect(assoc.macro).to eq :belongs_to
  end
end