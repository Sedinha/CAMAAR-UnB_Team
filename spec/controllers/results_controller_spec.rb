require 'rails_helper'
require 'csv'

RSpec.describe ResultsController, type: :controller do
  let(:admin) { User.create!(username: "admin", matricula: "123456", email: "admin@prof.br", password: "password", password_confirmation: "password", role: :admin) }
  let(:user) { User.create!(username: "user", matricula: "654321", email: "user@example.com", password: "password", password_confirmation: "password", role: :user) }
  let(:disciplina) { Disciplina.create!(nome: "Disciplina Teste") }
  let(:aluno) { Aluno.create!(nome: "Aluno Exemplo", curso: "Ciência da Computação", matricula: "123456", usuario: "test_user", formacao: "Graduando", ocupacao: "Discente", email: "aluno@example.com" ) }
  let(:turma) { Turma.create!(codigo: "123456", semestre: "2025-1", disciplina: disciplina) }
  let(:result) { double('Result', aluno: aluno, turma: turma, score: 90) }

  before do
    result_mock = result
    aluno_instance = aluno
    turma_instance = turma
    stub_const('Result', Class.new do
      define_singleton_method(:includes) do |*args|
        self
      end

      define_singleton_method(:all) do
        [result_mock]
      end
    end)
  end

  module ControllerHelpers
    def sign_in(user)
      request.session[:user_id] = user.id
    end

    def sign_out
      request.session[:user_id] = nil
    end
  end

  describe "GET #export" do
    include ControllerHelpers

    context "when user is not authenticated" do
      it "redirects to root page" do
        get :export, format: :csv
        expect(response).to redirect_to(root_path)
      end
    end

    context "when user is not an admin" do
      before { sign_in user }

      it "redirects to root with an alert" do
        get :export, format: :csv
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("Acesso negado!")
      end
    end

    context "when user is an admin" do
      before do
        sign_in admin
      end

      it "returns a success response" do
        get :export, format: :csv
        expect(response).to have_http_status(:ok)
      end

      it "returns the correct CSV content" do
        get :export, format: :csv
        csv = CSV.parse(response.body, headers: true)
        expect(csv.headers).to eq(["Aluno", "Turma", "Nota"])
        expect(csv[0]["Aluno"]).to eq(aluno.nome)
        expect(csv[0]["Turma"]).to eq(turma.codigo)
        expect(csv[0]["Nota"]).to eq(result.score.to_s)
      end
    end
  end
end