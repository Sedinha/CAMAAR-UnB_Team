Feature: criar template do formulario

    As um Administrador
    I Want criar um template de formulário contendo as questões do formulário
    So That posso criar formulários de avaliações para avaliar o desempenho das turmas

    Scenario: Criar template de formulário
        Given que estou na página de Templates
        When eu clico em Criar Template
        And eu preencho o formulario de criação de template
        And eu preencho as questões do formulário
        And eu clico em Criar
        Then eu devo ver o template de formulário na lista de templates
