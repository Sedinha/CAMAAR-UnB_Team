require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(username: "exampleuser", matricula: "123456", email: "user@example.com", password: "password", password_confirmation: "password", role: "user")
  }

  describe "Validations" do
    it "é valido com atributos válidos" do
      expect(subject).to be_valid
    end

    it "não é valido sem um username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "não é valido sem uma matricula" do
      subject.matricula = nil
      expect(subject).to_not be_valid
    end

    it "não é valido sem uma senha" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "não é valido se a senha é muito pequena" do
      subject.password = "short"
      expect(subject).to_not be_valid
    end

    it "não é valido sem a role" do
      subject.role = nil
      expect(subject).to_not be_valid
    end

    it "não é valido com uma matricula duplicada" do
      described_class.create!(username: "anotheruser", matricula: "123456", email: "another@example.com", password: "password", password_confirmation: "password", role: "user")
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "belongs to aluno" do
      association = described_class.reflect_on_association(:aluno)
      expect(association.macro).to eq :belongs_to
    end

    it "has many coordenador" do
      association = described_class.reflect_on_association(:coordenador)
      expect(association.macro).to eq :has_many
    end
  end

  describe "Enums" do
    it "defines roles enum" do
      expect(described_class.roles.keys).to contain_exactly("user", "admin")
    end
  end
end