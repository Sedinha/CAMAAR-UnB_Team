Feature: Visualização de Resultados
  As um Administrador
  I want visualizar e exportar os resultados das avaliações
  In order to analisar o desempenho das turmas

  Scenario: Exportar resultados em CSV
    Given que eu estou na página de Resultados
    When eu seleciono um formulário específico
    And eu clico em Exportar CSV
    Then eu devo receber um arquivo CSV com os resultados
