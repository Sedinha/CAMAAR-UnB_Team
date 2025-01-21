Feature: Importação de Dados do SIGAA
  As um Administrador
  I want importar dados de turmas, matérias e participantes do SIGAA
  In order to alimentar a base de dados do sistema

  Scenario: Importação bem-sucedida de dados
    Given que eu estou logado como administrador
    And eu estou na página de "Importação"
    When eu seleciono o arquivo JSON do SIGAA
    And eu clico em "Importar Dados"
    Then eu devo ver a mensagem "Dados importados com sucesso"
    And os novos registros devem aparecer no sistema