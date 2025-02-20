=begin

require 'rails_helper'
require 'csv'

RSpec.describe "Exportação de Resultados", type: :request do
  let!(:class_info) { ClassInfo.create!(code: "CIC0097", class_code: "TA", semester: "2021.2") }
  let!(:student1) { Student.create!(name: "Ana Clara", class_info: class_info) }
  let!(:student2) { Student.create!(name: "Andre Carvalho", class_info: class_info) }
  let!(:result1) { Result.create!(student: student1, score: 8) }
  let!(:result2) { Result.create!(student: student2, score: 9) }
  let!(:admin) { User.create!(email: "admin@example.com", password: "password", role: "admin") }

  before do
    sign_in admin
  end

  describe "GET /export_results.csv" do
    it "deve baixar um arquivo CSV com os resultados" do
      get export_results_path, headers: { "HTTP_ACCEPT" => "text/csv" }

      expect(response).to have_http_status(:success)
      expect(response.header['Content-Disposition']).to include('attachment; filename="resultados.csv"')

      csv = CSV.parse(response.body, headers: true)
      expect(csv.headers).to include("Aluno", "Turma", "Nota")
      expect(csv.count).to eq(2)
    end

    it "deve conter apenas notas entre 0 e 10" do
      get export_results_path, headers: { "HTTP_ACCEPT" => "text/csv" }

      csv = CSV.parse(response.body, headers: true)
      scores = csv.map { |row| row["Nota"].to_i }
      expect(scores.all? { |s| s.between?(0, 10) }).to be true
    end
  end
end

=end