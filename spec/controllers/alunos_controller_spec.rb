require 'rails_helper'

RSpec.describe AlunosController, type: :controller do
  let(:valid_attributes) {
    { nome: "Aluno Teste", curso: "Ciência da Computação", matricula: "123456", usuario: "test_user", formacao: "Graduando", ocupacao: "Discente", email: "aluno@example.com" }
  }

  let(:new_attributes) {
    { nome: "Aluno Teste Atualizado", curso: "Engenharia de Software", matricula: "654321", usuario: "updated_user", formacao: "Graduado", ocupacao: "Discente", email: "aluno_updated@example.com" }
  }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Aluno" do
        expect {
          post :create, params: { aluno: valid_attributes }
        }.to change(Aluno, :count).by(1)
      end

      it "redirects to the created aluno" do
        post :create, params: { aluno: valid_attributes }
        expect(response).to redirect_to(Aluno.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested aluno" do
        aluno = Aluno.create! valid_attributes
        put :update, params: { id: aluno.to_param, aluno: new_attributes }
        aluno.reload
        expect(aluno.nome).to eq("Aluno Teste Atualizado")
        expect(aluno.curso).to eq("Engenharia de Software")
      end

      it "redirects to the aluno" do
        aluno = Aluno.create! valid_attributes
        put :update, params: { id: aluno.to_param, aluno: valid_attributes }
        expect(response).to redirect_to(aluno)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested aluno" do
      aluno = Aluno.create! valid_attributes
      expect {
        delete :destroy, params: { id: aluno.to_param }
      }.to change(Aluno, :count).by(-1)
    end

    it "redirects to the alunos list" do
      aluno = Aluno.create! valid_attributes
      delete :destroy, params: { id: aluno.to_param }
      expect(response).to redirect_to(alunos_url)
    end
  end
end