require 'rails_helper'

RSpec.describe DisciplinasController, type: :controller do
  let(:departamento) { Departamento.create!(nome: "Departamento de Computação") }
  let(:disciplina) { Disciplina.create!(codigo: "COMP101", nome: "Introdução à Computação", departamento: departamento) }

  before do
    allow(Disciplina).to receive(:find).and_return(disciplina)
  end

  describe "GET #index" do
    it "assigns all disciplinas as @disciplinas" do
      get :index
      expect(controller.instance_variable_get(:@disciplinas)).to eq([disciplina])
    end
  end

  describe "GET #new" do
    it "assigns a new disciplina as @disciplina" do
      get :new
      expect(controller.instance_variable_get(:@disciplina)).to be_a_new(Disciplina)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Disciplina" do
        expect {
          post :create, params: { disciplina: { codigo: "COMP102", nome: "Algoritmos", departamento_id: departamento.id } }
        }.to change(Disciplina, :count).by(1)
      end

      it "assigns a newly created disciplina as @disciplina" do
        post :create, params: { disciplina: { codigo: "COMP102", nome: "Algoritmos", departamento_id: departamento.id } }
        expect(controller.instance_variable_get(:@disciplina)).to be_a(Disciplina)
        expect(controller.instance_variable_get(:@disciplina)).to be_persisted
      end

      it "redirects to the created disciplina" do
        post :create, params: { disciplina: { codigo: "COMP102", nome: "Algoritmos", departamento_id: departamento.id } }
        expect(response).to redirect_to(Disciplina.last)
      end
    end

    context "with invalid params" do
      before do
        allow_any_instance_of(Disciplina).to receive(:save).and_return(false)
      end

      it "assigns a newly created but unsaved disciplina as @disciplina" do
        post :create, params: { disciplina: { codigo: nil, nome: nil, departamento_id: nil } }
        expect(controller.instance_variable_get(:@disciplina)).to be_a_new(Disciplina)
        expect(controller.instance_variable_get(:@disciplina)).to_not be_persisted
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) { { codigo: "COMP103", nome: "Estruturas de Dados", departamento_id: departamento.id } }

      it "updates the requested disciplina" do
        patch :update, params: { id: disciplina.id, disciplina: new_attributes }
        disciplina.reload
        expect(disciplina.codigo).to eq(new_attributes[:codigo])
        expect(disciplina.nome).to eq(new_attributes[:nome])
      end

      it "assigns the requested disciplina as @disciplina" do
        patch :update, params: { id: disciplina.id, disciplina: new_attributes }
        expect(controller.instance_variable_get(:@disciplina)).to eq(disciplina)
      end

      it "redirects to the disciplina" do
        patch :update, params: { id: disciplina.id, disciplina: new_attributes }
        expect(response).to redirect_to(disciplina)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested disciplina" do
      disciplina_to_destroy = Disciplina.create!(codigo: "COMP104", nome: "Linguagens de Programação", departamento: departamento)
      expect {
        delete :destroy, params: { id: disciplina_to_destroy.id }
      }.to change(Disciplina, :count).by(-1)
    end

    it "redirects to the disciplinas list" do
      delete :destroy, params: { id: disciplina.id }
      expect(response).to redirect_to(disciplinas_url)
    end
  end
end