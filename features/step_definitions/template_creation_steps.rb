Given('que estou na página de Templates') do
  visit templates_path
end

When('eu clico em Criar Template') do
  visit new_template_path
end

When('eu preencho o formulario de criação de template') do
  fill_in 'Nome da Template', with: 'Template Teste'
  fill_in 'Semestre', with: '2021.1'
  fill_in 'Publicoalvo', with: 'Alunos de Engenharia de Software'
end

And('eu preencho as questões do formulário') do
  fill_in 'Título', with: 'Questão 1'
  fill_in 'conteúdo', with: 'Qual a sua idade?'
end

And('eu clico em Criar') do
  click_button 'Criar'
end

Then('eu devo ver o template de formulário na lista de templates') do
  visit templates_path
end