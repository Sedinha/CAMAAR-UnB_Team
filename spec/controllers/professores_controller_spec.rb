require 'rails_helper'

RSpec.describe ProfessoresController, type: :controller do
  let(:valid_attributes) {
    { nome: "Professor Teste", departamento: "Departamento de Computação", formacao: "Doutorado", usuario: "professor_teste", email: "professor@example.com", ocupacao: "Docente" }
  }

  let(:invalid_attributes) {
    { nome: "", departamento: "", formacao: "", usuario: "", email: "", ocupacao: "" }
  }

  let(:new_attributes) {
    { nome: "Professor Atualizado", departamento: "Departamento de Engenharia", formacao: "Mestrado", usuario: "professor_atualizado", email: "professor_updated@example.com", ocupacao: "Docente" }
  }

  describe "DELETE #destroy" do
    it "destroys the requested professor" do
      professor = Professor.create! valid_attributes
      expect {
        delete :destroy, params: { id: professor.to_param }
      }.to change(Professor, :count).by(-1)
    end

    it "redirects to the professores list" do
      professor = Professor.create! valid_attributes
      delete :destroy, params: { id: professor.to_param }
      expect(response).to redirect_to(professores_url)
    end
  end
end