Given('eu estou logado como aluno') do
  @aluno = FactoryBot.create(:aluno)
  login_as(@aluno, scope: :usuario)
end

Given('eu estou na página de {string}') do |pagina|
  visit path_to(pagina)
end

When('eu seleciono o formulário pendente') do
  click_link 'Responder Avaliação'
end

When('eu preencho todas as questões') do
  fill_in 'questao_1', with: 'Ótimo'
  fill_in 'questao_2', with: 'Muito bom'
end

When('eu clico em {string}') do |botao|
  click_button botao
end

Then('eu devo ver a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end