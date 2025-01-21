Feature: Gerenciamento de Senha
  As um Usuário
  I want definir ou redefinir minha senha
  In order to acessar o sistema

  Scenario: Definição inicial de senha
    Given que eu recebi um email de cadastro
    When eu clico no link de definição de senha
    And eu preencho o campo "nova_senha" com "senha123"
    And eu preencho o campo "confirmar_senha" com "senha123"
    And eu clico em "Definir Senha"
    Then eu devo ver a mensagem "Senha definida com sucesso"

  Scenario: Redefinição de senha
    Given que eu cliquei em "Esqueci minha senha"
    When eu preencho o campo "email" com "usuario@example.com"
    And eu clico em "Enviar email de recuperação"
    Then eu devo receber um email com instruções para redefinir a senha
