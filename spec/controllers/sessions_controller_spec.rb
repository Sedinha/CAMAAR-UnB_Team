require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { User.create!(username: "user", matricula: "654321", email: "user@example.com", password: "password", password_confirmation: "password") }

  describe "DELETE #destroy" do
    before do
      session[:user_id] = user.id
    end

    it "logs out the user and redirects to root path" do
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq("Logout realizado com sucesso !")
    end
  end
end