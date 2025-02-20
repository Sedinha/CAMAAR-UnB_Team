require 'rails_helper'

RSpec.describe Template, type: :model do
  subject { described_class.new(nome: "Template Teste", semestre: "2021/1", publicoAlvo: "Estudantes") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a nome" do
      subject.nome = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a semestre" do
      subject.semestre = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a publicoAlvo" do
      subject.publicoAlvo = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has many questions" do
      assoc = described_class.reflect_on_association(:questions)
      expect(assoc.macro).to eq :has_many
    end

    it "should destroy associated questions when template is destroyed" do
      template = Template.create!(nome: "Template Teste", semestre: "2021/1", publicoAlvo: "Estudantes")
      question = template.questions.create!(title: "Questão 1", question_type: "text", content: "Conteúdo da questão 1")
      expect { template.destroy }.to change { Question.count }.by(-1)
    end
  end

  describe "Nested attributes" do
    it "accepts nested attributes for questions" do
      expect(Template.nested_attributes_options.keys).to include(:questions)
    end

    it "rejects nested attributes for questions if all fields are blank" do
      subject.questions_attributes = [{ title: "", question_type: "", content: "" }]
      expect(subject.questions).to be_empty
    end
  end
end