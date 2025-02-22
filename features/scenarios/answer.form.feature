Feature: Responder Formulário
  As um Participante de uma turma
  I want responder o questionário sobre a turma
  In order to submeter minha avaliação

  Scenario: Responder formulário completo
    Given eu estou na página de Avaliações
    When eu seleciono o formulário pendente
    And eu preencho todas as questões
    And eu clico em Enviar
    Then eu devo ver a página de Avaliações