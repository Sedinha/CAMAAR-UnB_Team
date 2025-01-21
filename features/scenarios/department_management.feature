Feature: Gerenciamento por Departamento
  As um Administrador
  I want gerenciar somente as turmas do meu departamento
  In order to avaliar o desempenho das turmas no semestre atual

  Scenario: Visualizar turmas do departamento
    Given que eu estou logado como administrador do departamento "CIC"
    When eu acesso a página de "Turmas"
    Then eu devo ver apenas as turmas do departamento "CIC"