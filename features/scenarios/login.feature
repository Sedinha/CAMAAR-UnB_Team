Feature: Sistema de Login
  As um Usuário do sistema
  I want acessar o sistema utilizando um e-mail ou matrícula e uma senha já cadastrada
  In order to responder formulários ou gerenciar o sistema

  Scenario: Login bem-sucedido como administrador
    Given que eu estou na página de login
    When eu preencho o campo "email" com "admin@example.com"
    And eu preencho o campo "senha" com "senha123"
    And eu clico em "Entrar"
    Then eu devo ver o menu lateral com a opção "Gerenciamento"

  Scenario: Login bem-sucedido como aluno
    Given que eu estou na página de login
    When eu preencho o campo "email" com "aluno@example.com"
    And eu preencho o campo "senha" com "senha123"
    And eu clico em "Entrar"
    Then eu devo ver a aba "Avaliações"