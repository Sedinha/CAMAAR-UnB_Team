require 'rails_helper'

RSpec.describe TurmasController, type: :controller do
  let(:disciplina) { Disciplina.create!(codigo: "CIC0097", nome: "Matemática") }
  let(:valid_attributes) {
    { codigo: "CIC0097", semestre: "2021.1", horario: "Segunda 10:00", professor_id: nil, disciplina_id: disciplina.id }
  }

  let(:invalid_attributes) {
    { codigo: "", semestre: "", horario: "" }
  }

  let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'valid_turmas.json'), 'application/json') }
  let(:file_with_members) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'valid_turmas_with_members.json'), 'application/json') }
  let(:invalid_file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'invalid_turmas.json'), 'application/json') }

  describe "GET #index" do
    it "returns a success response" do
      Turma.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Turma" do
        expect {
          post :create, params: { turma: valid_attributes }
        }.to change(Turma, :count).by(1)
      end

      it "redirects to the created turma" do
        post :create, params: { turma: valid_attributes }
        expect(response).to redirect_to(turmas_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { turma: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { codigo: "MAT102", semestre: "2021.2", horario: "Terça 11:00", disciplina_id: disciplina.id }
      }

      it "updates the requested turma" do
        turma = Turma.create! valid_attributes
        put :update, params: { id: turma.to_param, turma: new_attributes }
        turma.reload
        expect(turma.codigo).to eq("MAT102")
        expect(turma.semestre).to eq("2021.2")
        expect(turma.horario).to eq("Terça 11:00")
      end

      it "redirects to the turma" do
        turma = Turma.create! valid_attributes
        put :update, params: { id: turma.to_param, turma: valid_attributes }
        expect(response).to redirect_to(turma)
      end
    end

    context "with invalid params" do
      it "does not update the requested turma" do
        turma = Turma.create! valid_attributes
        put :update, params: { id: turma.to_param, turma: invalid_attributes }
        expect(response).to_not be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested turma" do
      turma = Turma.create! valid_attributes
      expect {
        delete :destroy, params: { id: turma.to_param }
      }.to change(Turma, :count).by(-1)
    end

    it "redirects to the turmas list" do
      turma = Turma.create! valid_attributes
      delete :destroy, params: { id: turma.to_param }
      expect(response).to redirect_to(turmas_path)
    end
  end

  describe "POST #import" do
    context "with valid file" do
      it "imports turmas from the file" do
        expect {
          post :import, params: { file: file }
        }.to change(Turma, :count).by(3) # Assuming valid_turmas.json contains 3 turmas
      end

      it "redirects to import page with notice" do
        post :import, params: { file: file }
        expect(response).to redirect_to(import_turmas_page_path)
        expect(flash[:notice]).to eq("Dados importados com sucesso!")
      end
    end

=begin
    context "without file" do
      it "redirects to import page with alert" do
        post :import, params: { file: nil }
        expect(response).to redirect_to(import_turmas_page_path)
        expect(flash[:alert]).to eq("Nenhum arquivo selecionado.")
      end
    end
=end    
  end

  describe "POST #import_members" do
    let!(:turma) { Turma.create!(codigo: "TA", semestre: "2021.2", disciplina: disciplina) }
    context "with valid file" do

  begin
      it "imports members from the file" do
        expect {
          post :import_members, params: { file: file_with_members }
        }.to change(Aluno, :count).by(3) # Assuming valid_turmas.json contains 1 alunos
      end
  end

      it "redirects to import page with notice" do
        post :import_members, params: { file: file_with_members }
        expect(response).to redirect_to(import_turmas_page_path)
        expect(flash[:notice]).to eq("Alunos e professores importados com sucesso!")
      end
    end
  end
end