Given('eu estou na página de Avaliações') do
  #visit path_to(pagina)
end

When('eu seleciono o formulário pendente') do
  #click_link 'Responder Avaliação'
end

When('eu preencho todas as questões') do
  #fill_in 'questao_1', with: 'Ótimo'
  #fill_in 'questao_2', with: 'Muito bom'
end

When('eu clico em Enviar') do
  #click_button 'Enviar'
end

Then('eu devo ver a página de Avaliações') do
  #expect(page).to have_content(mensagem)
end