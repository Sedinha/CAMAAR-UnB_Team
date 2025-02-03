Given("existe uma turma com alunos e resultados de formulários") do
  @class_info = ClassInfo.create!(code: "CIC0097", class_code: "TA", semester: "2021.2")
  @student1 = Student.create!(name: "Ana Clara", class_info: @class_info)
  @student2 = Student.create!(name: "Andre Carvalho", class_info: @class_info)

  @results = [
    Result.create!(student: @student1, score: 8),
    Result.create!(student: @student2, score: 9)
  ]
end

Given("estou logado como Administrador") do
  @admin = User.create!(email: "admin@example.com", password: "password", role: "admin")
  login_as(@admin, scope: :user)
end

When("eu acesso a página de exportação de resultados") do
  visit export_results_path
end

When("eu clico no botão {string}") do |button_text|
  click_button button_text
end

Then("um arquivo CSV contendo os resultados deve ser baixado") do
  expect(page.response_headers['Content-Disposition']).to include("attachment; filename=\"resultados.csv\"")
end

Then("o arquivo deve conter as notas de 0 a 10") do
  csv_data = CSV.parse(page.body, headers: true)
  scores = csv_data.map { |row| row["Nota"].to_i }
  expect(scores.all? { |s| s.between?(0, 10) }).to be true
end

Then("o CSV deve conter as colunas {string}, {string}, {string}") do |col1, col2, col3|
  csv_data = CSV.parse(page.body, headers: true)
  expect(csv_data.headers).to include(col1, col2, col3)
end
