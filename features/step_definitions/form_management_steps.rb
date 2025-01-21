Given('eu estou logado como administrador') do
  @admin = FactoryBot.create(:admin)
  login_as(@admin, scope: :admin)
end

Given('eu estou na página de {string}') do |pagina|
  visit path_to(pagina)
end

When('eu clico em {string}') do |botao|
  click_link botao
end

When('eu preencho o campo {string} com {string}') do |campo, valor|
  fill_in campo, with: valor
end

When('eu adiciono questões ao template') do
  fill_in 'questao_1', with: 'Como você avalia o professor?'
  fill_in 'questao_2', with: 'Como você avalia o conteúdo da matéria?'
end

When('eu clico em {string}') do |botao|
  click_button botao
end

Then('eu devo ver o novo template na lista de templates') do
  expect(page).to have_content('Avaliação Semestral')
end

When('eu seleciono o template {string}') do |template|
  select template, from: 'Template'
end

When('eu seleciono a turma {string}') do |turma|
  select turma, from: 'Turma'
end

When('eu seleciono o tipo {string}') do |tipo|
  select tipo, from: 'Tipo'
end

Then('eu devo ver o novo formulário na lista de formulários') do
  expect(page).to have_content('Avaliação Semestral')
end