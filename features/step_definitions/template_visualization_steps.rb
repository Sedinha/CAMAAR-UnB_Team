Given('que eu estou na página de Templates') do
  visit templates_path
  expect(page).to have_content('Gerenciamento - templates')
end

When('eu seleciono um template para visualização') do
  visit templates_path(2)
end

Then('eu devo ver as questões do template') do
  expect(page).to have_current_path(templates_path(2))
end