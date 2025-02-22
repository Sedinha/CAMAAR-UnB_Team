Feature: Cadastrar usuarios no sistema
  As um Administrador
  I want cadastrar usuarios no sistema
  In order to permitir o acesso ao sistema

  Scenario: Cadastro bem-sucedido de usuario
    Given eu estou na página de cadastro
    When eu preencho o formulário com os dados do usuario
    And eu clico em Cadastrar
    Then o novo registro deve aparecer no sistema