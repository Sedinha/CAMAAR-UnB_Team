require 'rails_helper'

RSpec.describe QuestaoOption, type: :model do
  let(:template) { Template.create!(nome: "Template Teste", semestre: "2022/1", publicoAlvo: "estudantes") }
  let(:question) { Question.create!(title: "Título da Questão", question_type: :radio, content: "Conteúdo da Questão", template: template) }

  it "é valido com atributos válidos" do
    questao_option = QuestaoOption.new(nome: "Nome da Opção", texto: "Texto da Opção", question: question)
    expect(questao_option).to be_valid
  end

  it "não é valido sem um nome" do
    questao_option = QuestaoOption.new(texto: "Texto da Opção", question: question)
    expect(questao_option).to_not be_valid
  end

  it "não é valido sem um texto" do
    questao_option = QuestaoOption.new(nome: "Nome da Opção", question: question)
    expect(questao_option).to_not be_valid
  end

  it "não é valido sem um question_id" do
    questao_option = QuestaoOption.new(nome: "Nome da Opção", texto: "Texto da Opção")
    expect(questao_option).to_not be_valid
  end

  it "pertence a uma question" do
    assoc = QuestaoOption.reflect_on_association(:question)
    expect(assoc.macro).to eq :belongs_to
  end
end