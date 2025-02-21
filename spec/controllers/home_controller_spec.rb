require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:admin) { User.create!(username: "admin", matricula: "123456", email: "admin@prof.br", password: "password", password_confirmation: "password", role: :admin) }
  let(:user) { User.create!(username: "user", matricula: "654321", email: "user@example.com", password: "password", password_confirmation: "password", role: :user) }

  describe "POST #create" do
    context "with valid admin credentials" do
      it "logs in the admin and redirects to admin management path" do
        post :create, params: { matricula: admin.matricula, password: admin.password }
        expect(session[:user_id]).to eq(admin.id)
        expect(session[:user_type]).to eq("admin")
        expect(response).to redirect_to(admin_management_path)
      end
    end

    context "with valid user credentials" do
      it "logs in the user and redirects to new questionario path" do
        post :create, params: { matricula: user.matricula, password: user.password }
        expect(session[:user_id]).to eq(user.id)
        expect(session[:user_type]).to eq("user")
        expect(response).to redirect_to(new_questionario_path)
      end
    end

    context "with blank credentials" do
      it "returns unprocessable entity status" do
        post :create, params: { matricula: "", password: "" }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(flash[:alert]).to eq("Matricula e senha são obrigatórios")
      end
    end

    context "with invalid credentials" do
      it "returns unprocessable entity status" do
        post :create, params: { matricula: "invalid", password: "invalid" }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(flash[:alert]).to eq("Matricula ou senha inválidos")
      end
    end
  end
end