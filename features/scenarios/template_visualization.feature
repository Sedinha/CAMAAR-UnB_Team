Feature: Visualização de Templates
    As um Administrador
    I Want visualizar os templates criados
    In order to editar e/ou deletar um template que eu criei

    Scenario: Visualizar template existente
        Given que eu estou na página de Templates
        When eu seleciono um template para visualização
        Then eu devo ver as questões do template