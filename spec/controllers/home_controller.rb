require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "POST #create" do
    context "with valid credentials" do
      let(:user) { create(:user, password: "password123") }
      let(:admin) { create(:user, :admin, password: "password123") }

      it "logs in regular user successfully" do
        post :create, params: { 
          matricula: user.matricula, 
          password: "password123" 
        }
        
        expect(session[:user_id]).to eq(user.id)
        expect(session[:user_type]).to eq("user")
        expect(response).to redirect_to(user_dashboard_path)
        expect(flash[:notice]).to eq("Login efetuado com sucesso!")
      end

      it "logs in admin user successfully" do
        post :create, params: { 
          matricula: admin.matricula, 
          password: "password123" 
        }
        
        expect(session[:user_id]).to eq(admin.id)
        expect(session[:user_type]).to eq("admin")
        expect(response).to redirect_to(new_questionario_path)
        expect(flash[:notice]).to eq("Login efetuado com sucesso!")
      end
    end

    context "with invalid credentials" do
      it "does not log in with blank credentials" do
        post :create, params: { matricula: "", password: "" }
        
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(root_path)
        expect(response.status).to eq(422)
      end

      it "does not log in with invalid password" do
        user = create(:user, password: "password123")
        
        post :create, params: { 
          matricula: user.matricula, 
          password: "wrong_password" 
        }
        
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(root_path)
        expect(response.status).to eq(422)
      end

      it "does not log in with non-existent matricula" do
        post :create, params: { 
          matricula: "nonexistent", 
          password: "password123" 
        }
        
        expect(session[:user_id]).to be_nil
        expect(response).to redirect_to(root_path)
        expect(response.status).to eq(422)
      end
    end
  end
end