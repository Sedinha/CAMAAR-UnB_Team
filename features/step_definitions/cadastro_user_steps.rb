Given('eu estou na página de cadastro') do
  # code to navigate to the registration page
  visit signup_path
end

When('eu preencho o formulário com os dados do usuario') do
  fill_in 'Nome', with: 'John Doe'
  fill_in 'Matricula', with: '33'
  fill_in 'Email', with: '33@user.com'
  fill_in 'Password', with: '123456'
  fill_in 'Password confirmation', with: '123456'
end

And('eu clico em Cadastrar') do
  click_button 'Criar Conta'
end

Then('o novo registro deve aparecer no sistema') do
  expect(User.count).to be > 0
end