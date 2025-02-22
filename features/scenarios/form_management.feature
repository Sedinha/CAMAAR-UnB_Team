Feature: Gerenciamento de Formulários
  As um Administrador
  I want criar e gerenciar templates e formulários de avaliação
  In order to avaliar o desempenho das turmas

  Scenario: Criar formulário para turma
    Given que eu estou na página de Formulários
    When eu clico em Novo Formulário
    And eu seleciono o template Avaliação Semestral
    And eu seleciono a turma Banco de Dados
    And eu seleciono o tipo Discente
    And clico em Criar
    Then eu devo ver o novo formulário na lista de formulários