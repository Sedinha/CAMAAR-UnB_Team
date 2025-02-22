require 'rails_helper'

RSpec.describe MatriculasController, type: :controller do
  let(:disciplina) { Disciplina.create!(codigo: "MAT101", nome: "Matemática") }
  let(:aluno) { Aluno.create!(nome: "Aluno Exemplo", curso: "Ciência da Computação", matricula: "123456", usuario: "test_user", formacao: "Graduando", ocupacao: "Discente", email: "aluno@example.com" ) } 
  let(:turma) { Turma.create!(codigo: "123456", semestre: "2025-1", disciplina: disciplina) }
  let(:valid_attributes) {
    { aluno_id: aluno.id, turma_id: turma.id }
  }

  let(:invalid_attributes) {
    { aluno_id: nil, turma_id: nil }
  }

  let!(:matricula) { Matricula.create!(valid_attributes) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to be_an(Array)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: matricula.to_param }, format: :json
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(matricula.id)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, format: :json
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to be_nil
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "returns an unprocessable entity response" do
        post :create, params: { matricula: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { aluno_id: aluno.id, turma_id: turma.id }
      }

      it "updates the requested matricula" do
        put :update, params: { id: matricula.to_param, matricula: new_attributes }, format: :json
        matricula.reload
        expect(matricula.aluno_id).to eq(aluno.id)
        expect(matricula.turma_id).to eq(turma.id)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested matricula" do
      expect {
        delete :destroy, params: { id: matricula.to_param }, format: :json
      }.to change(Matricula, :count).by(-1)
    end
  end
end