Feature: Gerenciamento de Templates
  As um Administrador
  I want editar e deletar templates que eu criei
  In order to manter os templates organizados

  Scenario: Editar template existente
    Given que eu estou na página de "Templates"
    When eu seleciono um template para edição
    And eu modifico as questões do template
    And eu clico em "Salvar Alterações"
    Then eu devo ver as alterações refletidas no template

  Scenario: Deletar template
    Given que eu estou na página de "Templates"
    When eu seleciono um template para deleção
    And eu confirmo a deleção
    Then eu não devo mais ver o template na lista