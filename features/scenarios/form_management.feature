Feature: Gerenciamento de Formulários
  As um Administrador
  I want criar e gerenciar templates e formulários de avaliação
  In order to avaliar o desempenho das turmas

  Scenario: Criar template de formulário
    Given que eu estou logado como administrador
    And eu estou na página de "Templates"
    When eu clico em "Novo Template"
    And eu preencho o campo "nome" com "Avaliação Semestral"
    And eu adiciono questões ao template
    And eu clico em "Salvar Template"
    Then eu devo ver o novo template na lista de templates

  Scenario: Criar formulário para turma
    Given que eu estou na página de "Formulários"
    When eu clico em "Novo Formulário"
    And eu seleciono o template "Avaliação Semestral"
    And eu seleciono a turma "Programação 1"
    And eu seleciono o tipo "Discente"
    And eu clico em "Criar Formulário"
    Then eu devo ver o novo formulário na lista de formulários