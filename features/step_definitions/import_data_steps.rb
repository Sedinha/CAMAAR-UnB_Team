Given('que eu estou logado como administrador') do
  @admin = FactoryBot.create(:admin)
  login_as(@admin, scope: :admin)
end

Given('eu estou na página de {string}') do |pagina|
  visit path_to(pagina)
end

When('eu seleciono o arquivo JSON do SIGAA') do
  attach_file('file', Rails.root.join('spec', 'fixtures', 'files', 'sigaa_data.json'))
end

When('eu clico em {string}') do |botao|
  click_button botao
end

Then('eu devo ver a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('os novos registros devem aparecer no sistema') do
  expect(Turma.count).to be > 0
  expect(Materia.count).to be > 0
  expect(Participante.count).to be > 0
end