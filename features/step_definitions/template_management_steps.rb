Given('eu estou na página Templates') do
  visit templates_path
end

When('eu seleciono um template para edição') do
  #visit edit_template_path(2)
end

When('eu modifico as questões do template') do
  #fill_in 'conteúdo', with: 'Magrelo?'
end

When('eu clico em Atualizar') do
  #click_button Atualizar
end

Then('eu devo ver as alterações refletidas no template') do
  expect(page).to have_content('Gerenciamento - templates')
end

Given('eu estou na página de Templates') do
  visit templates_path
end

When('eu seleciono um template para deleção') do
  #click_link 'Deletar'
end

When('eu confirmo a deleção') do
  #page.driver.browser.switch_to.alert.accept
end

Then('eu não devo mais ver o template na lista') do
  #expect(page).not_to have_content('Avaliação Semestral')
end