Given('eu estou logado como administrador do departamento {string}') do |departamento|
  @admin = FactoryBot.create(:admin, departamento: departamento)
  login_as(@admin, scope: :admin)
end

When('eu acesso a página de {string}') do |pagina|
  visit path_to(pagina)
end

Then('eu devo ver apenas as turmas do departamento {string}') do |departamento|
  expect(page).to have_content(departamento)
  Turma.where(departamento: departamento).each do |turma|
    expect(page).to have_content(turma.nome)
  end
end