require 'rails_helper'

RSpec.describe ProfessorDisciplinasController, type: :controller do
  let(:professor) { Professor.create!(nome: "Professor Teste", departamento: "Departamento de Computação", email: "professor@example.com") }
  let(:disciplina) { Disciplina.create!(nome: "Disciplina Teste") }
  let(:professor_disciplina) { ProfessorDisciplina.create!(professor: professor, disciplina: disciplina) }

  before do
    @request.env["action_dispatch.request.path_parameters"] = {controller: "professor_disciplinas"}
  end

  describe "PATCH #update" do
    context "com parâmetros válidos" do
      let(:new_attributes) { { professor_id: professor.id, disciplina_id: disciplina.id } }

      it "atualiza o professor_disciplina solicitado" do
        patch :update, params: { id: professor_disciplina.id, professor_disciplina: new_attributes }
        professor_disciplina.reload
        expect(professor_disciplina.professor_id).to eq(new_attributes[:professor_id])
        expect(professor_disciplina.disciplina_id).to eq(new_attributes[:disciplina_id])
      end

      it "redireciona para o professor_disciplina" do
        patch :update, params: { id: professor_disciplina.id, professor_disciplina: new_attributes }
        expect(response).to redirect_to(professor_disciplina)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destrói o professor_disciplina solicitado" do
      professor_disciplina_to_destroy = ProfessorDisciplina.create!(professor: professor, disciplina: disciplina)
      expect {
        delete :destroy, params: { id: professor_disciplina_to_destroy.id }
      }.to change(ProfessorDisciplina, :count).by(-1)
    end

    it "redireciona para a lista professor_disciplinas" do
      delete :destroy, params: { id: professor_disciplina.id }
      expect(response).to redirect_to(professor_disciplinas_url)
    end
  end
end