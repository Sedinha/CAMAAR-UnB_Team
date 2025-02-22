Feature: Importação de Dados do SIGAA
  As um Administrador
  I want importar dados de turmas, matérias e participantes do SIGAA
  In order to alimentar a base de dados do sistema

  Scenario: Importação bem-sucedida de dados
    Given eu estou na página de importação
    When eu seleciono o arquivo JSON do SIGAA
    And eu clico em Importar Turmas
    Then os novos registros devem aparecer no sistema