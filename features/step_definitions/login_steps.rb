Given('que eu estou na página de login') do
  visit root_path
end

When('eu preencho o formulário de login') do
  fill_in 'matricula', with: '4'
  fill_in 'password', with: '123456'
  click_button 'Login'
  save_path = save_page # Salva o HTML sem abrir automaticamente
  puts "Abra este arquivo no navegador: file://#{save_path}"
end


Then('eu devo estar na pagina de management') do
  #expect(page).to have_current_path(admin_management_path)
end