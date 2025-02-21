require 'rails_helper'

RSpec.describe QuestionariosController, type: :controller do
  let(:admin_user) { User.create!(username: "admin", matricula: "221018924", email: "admin@example.com", password: "password", role: :admin) }
  let(:disciplina) { Disciplina.create!(nome: "Disciplina Teste") }
  let(:turma) { Turma.create!(codigo: "123456", semestre: "2025-1", disciplina: disciplina) }
  let(:template) { Template.create!(nome: "Template Teste", semestre: "2021/1", publicoAlvo: "Estudantes") }
  let(:questionario) { Questionario.create!(nome: "Questionário Teste", turma: turma, template: template) }
 

  before do
    @request.env["action_dispatch.request.path_parameters"] = {controller: "questionarios"}
  end

  def sign_in(user)
    @request.session[:user_id] = user.id
  end



  describe "GET #new" do
    context "when user is an admin" do
      before do
        sign_in admin_user
      end

      it "returns a successful response" do
        get :new
        expect(response).to be_successful
      end
    end
  end

  describe "POST #create" do
    context "when user is an admin" do
      before do
        sign_in admin_user
      end

      it "creates a new questionario" do
        expect {
          post :create, params: { questionario: { nome: "Novo Questionário", turma_id: turma.id, template_id: template.id } }
        }.to change(Questionario, :count).by(1)
        expect(response).to redirect_to(questionarios_path)
        expect(flash[:notice]).to eq "Questionário criado com sucesso."
      end
    end
  end
end