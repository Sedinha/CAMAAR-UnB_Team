Given('eu estou na página de {string}') do |pagina|
  visit path_to(pagina)
end

When('eu seleciono um formulário específico') do
  select 'Avaliação Semestral', from: 'Formulários'
end

When('eu clico em {string}') do |botao|
  click_button botao
end

Then('eu devo receber um arquivo CSV com os resultados') do
  expect(page.response_headers['Content-Type']).to include 'text/csv'
end