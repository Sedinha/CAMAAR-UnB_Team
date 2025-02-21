Given('que eu estou na página de Resultados') do
  #visit resultados_path
end

When('eu seleciono um formulário específico') do
  #select 'Avaliação Semestral', from: 'Formulários'
end

When('eu clico em Exportar CSV') do
  #click_button 'Exportar'
end

Then('eu devo receber um arquivo CSV com os resultados') do
  #expect(page.response_headers['Content-Type']).to include 'text/csv'
end