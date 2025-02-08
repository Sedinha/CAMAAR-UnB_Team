require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_attributes) do
        {
          username: "Test User",
          matricula: "123456",
          email: "test@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      end

      it "creates a new user" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "sets user role to admin if email ends with @prof.br" do
        post :create, params: {
          user: valid_attributes.merge(email: "test@prof.br")
        }
        expect(assigns(:user).role).to eq("admin")
      end

      it "sets user role to user if email doesn't end with @prof.br" do
        post :create, params: { user: valid_attributes }
        expect(assigns(:user).role).to eq("user")
      end

      it "redirects to correct path based on user role" do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to(user_dashboard_path)

        post :create, params: { user: valid_attributes.merge(email: "test@prof.br") }
        expect(response).to redirect_to(new_questionario_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a user with duplicate email" do
        create(:user, email: "test@example.com")

        expect {
          post :create, params: {
            user: {
              username: "Test User",
              matricula: "123456",
              email: "test@example.com",
              password: "password123",
              password_confirmation: "password123"
            }
          }
        }.not_to change(User, :count)
      end
    end
  end
end
