Feature: Responder Formulário
  As um Participante de uma turma
  I want responder o questionário sobre a turma
  In order to submeter minha avaliação

  Scenario: Responder formulário completo
    Given que eu estou logado como aluno
    And eu estou na página de "Avaliações"
    When eu seleciono o formulário pendente
    And eu preencho todas as questões
    And eu clico em "Enviar Avaliação"
    Then eu devo ver a mensagem "Avaliação enviada com sucesso"