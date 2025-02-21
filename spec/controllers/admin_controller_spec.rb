require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  let(:admin) { User.create!(username: "admin", matricula: "123456", email: "admin@prof.br", password: "password", password_confirmation: "password", role: :admin) }
  let(:user) { User.create!(username: "user", matricula: "654321", email: "user@example.com", password: "password", password_confirmation: "password", role: :user) }

  describe "GET #management" do
    context "as an admin" do
      before do
        session[:user_id] = admin.id
        session[:user_type] = "admin"
      end

      it "returns a success response" do
        get :management
        expect(response).to be_successful
      end
    end

    context "as a non-admin" do
      before do
        session[:user_id] = user.id
        session[:user_type] = "user"
      end

      it "redirects to the root path" do
        get :management
        expect(response).to redirect_to(root_path)
      end
    end
  end
end