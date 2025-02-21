Feature: Sistema de Login
  As um Usuário do sistema
  I want acessar o sistema utilizando um e-mail ou matrícula e uma senha já cadastrada
  In order to responder formulários ou gerenciar o sistema

  Scenario: Login bem-sucedido como administrador
    Given que eu estou na página de login
    When eu preencho o formulário de login
    Then eu devo estar na pagina de management