Feature: Exportação de Resultados para CSV

  Como Administrador
  Quero baixar um arquivo CSV contendo os resultados de um formulário
  A fim de avaliar o desempenho das turmas

  Background:
    Given existe uma turma com alunos e resultados de formulários

  Scenario: Administrador exporta os resultados para CSV com sucesso
    Given estou logado como Administrador
    When eu acesso a página de exportação de resultados
    And eu clico no botão "Exportar CSV"
    Then um arquivo CSV contendo os resultados deve ser baixado
    And o arquivo deve conter as notas de 0 a 10

  Scenario: CSV contém todos os resultados dos alunos
    Given estou logado como Administrador
    When eu exporto os resultados para CSV
    Then o CSV deve conter as colunas "Aluno", "Turma", "Nota"
    And todas as notas devem estar entre 0 e 10
