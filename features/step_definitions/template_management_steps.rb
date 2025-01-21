Given('eu estou na página de {string}') do |pagina|
  visit path_to(pagina)
end

When('eu seleciono um template para edição') do
  click_link 'Editar'
end

When('eu modifico as questões do template') do
  fill_in 'questao_1', with: 'Atualizada: Como você avalia o professor?'
end

When('eu clico em {string}') do |botao|
  click_button botao
end

Then('eu devo ver as alterações refletidas no template') do
  expect(page).to have_content('Atualizada: Como você avalia o professor?')
end

When('eu seleciono um template para deleção') do
  click_link 'Deletar'
end

When('eu confirmo a deleção') do
  page.driver.browser.switch_to.alert.accept
end

Then('eu não devo mais ver o template na lista') do
  expect(page).not_to have_content('Avaliação Semestral')
end