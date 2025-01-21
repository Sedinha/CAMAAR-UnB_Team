Given('que eu recebi um email de cadastro') do
  # Simulate receiving an email for password setup
  visit setup_password_path(token: 'valid_token')
end

When('eu clico no link de definição de senha') do
  click_link 'Definir Senha'
end

When('eu preencho o campo {string} com {string}') do |campo, valor|
  fill_in campo, with: valor
end

When('eu clico em {string}') do |botao|
  click_button botao
end

Then('eu devo ver a mensagem {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Given('que eu cliquei em {string}') do |texto|
  click_link texto
end

Then('eu devo receber um email com instruções para redefinir a senha') do
  # Simulate email receipt
  expect(ActionMailer::Base.deliveries.last.subject).to include("Instruções para redefinir a senha")
end