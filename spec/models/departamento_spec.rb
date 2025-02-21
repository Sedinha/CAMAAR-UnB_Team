require 'rails_helper'

RSpec.describe Departamento, type: :model do

  it "é valido com atributos válidos" do
    departamento = Departamento.new(nome: "Departamento de Computação")
    expect(departamento).to be_valid
  end

  it "não é valido sem um nome" do
    departamento = Departamento.new
    expect(departamento).to_not be_valid
  end

  it "possui muitas disciplinas" do
    assoc = Departamento.reflect_on_association(:disciplinas)
    expect(assoc.macro).to eq :has_many
  end

  it "possui um coordenador" do
    assoc = Departamento.reflect_on_association(:coordenador)
    expect(assoc.macro).to eq :has_one
  end
end
