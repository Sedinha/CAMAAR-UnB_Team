Given('eu estou na página de importação') do
  visit import_turmas_page_path
end

When('eu seleciono o arquivo JSON do SIGAA') do
  attach_file('turma_file', Rails.root.join('spec', 'fixtures', 'files', 'valid_turmas.json'))
end

When('eu clico em Importar Turmas') do
  click_button 'Importar Turmas'
end

Then('os novos registros devem aparecer no sistema') do
  expect(Turma.count).to be > 0
  expect(Disciplina.count).to be > 0
end