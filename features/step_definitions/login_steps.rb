Given('que eu estou na página de login') do
  visit login_path
end

When('eu preencho o campo {string} com {string}') do |campo, valor|
  fill_in campo, with: valor
end

When('eu clico em {string}') do |botao|
  click_button botao
end

Then('eu devo ver o menu lateral com a opção {string}') do |opcao|
  expect(page).to have_content(opcao)
end