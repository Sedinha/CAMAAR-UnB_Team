require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    { username: "exampleuser", matricula: "123456", email: "user@example.com", password: "password", password_confirmation: "password" }
  }

  let(:invalid_attributes) {
    { username: "", matricula: "", email: "", password: "", password_confirmation: "" }
  }

  describe "GET #new" do
    it "retorna uma resposta de sucesso" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "com parâmetros válidos" do
      it "cria um novo usuário" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redireciona para o caminho apropriado com base na função" do
        post :create, params: { user: valid_attributes }
        created_user = User.find_by(email: valid_attributes[:email])
        expect(session[:user_id]).to eq(created_user.id)
        expect(session[:user_type]).to eq(created_user.role)
        
        if created_user.admin?
          expect(response).to redirect_to(admin_management_path)
        else
          expect(response).to redirect_to(new_questionario_path)
        end
      end
    end

    context "com parâmetros inválidos" do
      it "retorna uma resposta de sucesso (que é a renderização da 'new' template)" do
        post :create, params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end