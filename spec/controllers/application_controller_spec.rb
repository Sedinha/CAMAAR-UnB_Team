require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :require_login, only: :index
    before_action :authenticate_user!, only: :new
    before_action :authenticate_admin!, only: :edit

    def index
      render plain: "Logged in"
    end

    def new
      render plain: "User authenticated"
    end

    def edit
      render plain: "Admin authenticated"
    end
  end

  let(:user) { User.create!(username: "user", matricula: "221018924", email: "user@example.com", password: "password", role: :user) }
  let(:admin) { User.create!(username: "admin", matricula: "221018936", email: "admin@prof.br", password: "password1", role: :admin) }


  describe "#current_user" do
    it "returns the current logged-in user" do
      session[:user_id] = user.id
      expect(subject.current_user).to eq(user)
    end

    it "returns nil if no user is logged in" do
      session[:user_id] = nil
      expect(subject.current_user).to be_nil
    end
  end

  describe "#current_admin" do
    before do
      allow(subject).to receive(:current_user).and_return(admin)
    end

    it "returns nil if no admin is logged in" do
      session[:user_id] = nil
      expect(subject.current_admin).to be_nil
    end
  end

  describe "#logged_in?" do
    it "returns true if a user is logged in" do
      session[:user_id] = user.id
      expect(subject.logged_in?).to be true
    end

    it "returns false if no user or admin is logged in" do
      session[:user_id] = nil
      expect(subject.logged_in?).to be false
    end
  end

  describe "#require_login" do
    context "when user is not logged in" do
      it "redirects to the login path" do
        get :index
        expect(response).to redirect_to(login_path)
        expect(flash[:alert]).to eq "Você precisa estar logado para acessar esta página."
      end
    end

    context "when user is logged in" do
      it "allows access to the page" do
        session[:user_id] = user.id
        get :index
        expect(response).to be_successful
        expect(response.body).to eq "Logged in"
      end
    end
  end

  describe "#authenticate_user!" do
    context "when user is not logged in" do
      it "redirects to the root path" do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    context "when user is logged in" do
      it "allows access to the page" do
        session[:user_id] = user.id
        get :new
        expect(response).to be_successful
        expect(response.body).to eq "User authenticated"
      end
    end
  end
end