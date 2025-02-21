=begin

require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
  let(:admin_user) { User.create!(username: "admin", matricula: "221018924", email: "admin@prof.br", password: "password", role: :admin) }
  let(:non_admin_user) { User.create!(username: "user", email: "user@example.com", password: "password", role: :user) }
  let(:aluno) { Aluno.create!(name: "Student Name", class_info: ClassInfo.create!(code: "Class 101")) }
  let(:result) { Result.create!(student: student, score: 90) }

  before do
    @request.env["action_dispatch.request.path_parameters"] = {controller: "results", action: "export"}
  end

  def sign_in(user)
    @request.session[:user_id] = user.id
  end

  def sign_out
    @request.session.delete(:user_id)
  end

  describe "GET #export" do
    context "when user is an admin" do
      before do
        sign_in admin_user
      end

      it "returns a CSV file" do
        get :export, format: :csv
        expect(response.headers['Content-Type']).to include 'text/csv'
        expect(response.headers['Content-Disposition']).to include 'filename="resultados.csv"'
        expect(response.body).to include "Aluno,Turma,Nota"
      end
    end
  end
end

=end