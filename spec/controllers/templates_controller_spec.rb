require 'rails_helper'

RSpec.describe TemplatesController, type: :controller do
  let(:valid_attributes) {
    { nome: "Template Teste", semestre: "2021/1", publicoAlvo: "Estudantes", questions_attributes: [{ title: "Questão 1", question_type: "text", content: "Conteúdo da questão 1" }] }
  }

  let(:invalid_attributes) {
    { nome: "", semestre: "", publicoAlvo: "", questions_attributes: [] }
  }

  let(:template) { Template.create!(valid_attributes) }

  describe "GET #index" do
    it "retorna uma resposta de sucesso" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "retorna uma resposta de sucesso" do
      get :show, params: { id: template.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "retorna uma resposta de sucesso" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "com parâmetros válidos" do
      it "cria um novo template" do
        expect {
          post :create, params: { template: valid_attributes }
        }.to change(Template, :count).by(1)
      end

      it "redireciona para a lista de templates" do
        post :create, params: { template: valid_attributes }
        expect(response).to redirect_to(templates_path)
      end
    end
    context "com parâmetros inválidos" do
      it "retorna uma resposta de sucesso (que é a renderização da 'new' template)" do
        post :create, params: { template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "GET #edit" do
    it "retorna uma resposta de sucesso" do
      get :edit, params: { id: template.to_param }
      expect(response).to be_successful
    end
  end

  describe "PUT #update" do
    context "com parâmetros válidos" do
      let(:new_attributes) {
        { nome: "Template Atualizado", semestre: "2022/2", publicoAlvo: "Professores" }
      }

      it "atualiza o template requisitado" do
        put :update, params: { id: template.to_param, template: new_attributes }
        template.reload
        expect(template.nome).to eq("Template Atualizado")
        expect(template.semestre).to eq("2022/2")
        expect(template.publicoAlvo).to eq("Professores")
      end

      it "redireciona para a lista de templates" do
        put :update, params: { id: template.to_param, template: valid_attributes }
        expect(response).to redirect_to(templates_path)
      end
    end

    context "com parâmetros inválidos" do
      it "retorna uma resposta de sucesso (que é a renderização da 'edição' do template)" do
        put :update, params: { id: template.to_param, template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroi o template requisitado" do
      template = Template.create! valid_attributes
      expect {
        delete :destroy, params: { id: template.to_param }
      }.to change(Template, :count).by(-1)
    end

    it "redireciona para a lista de templates" do
      delete :destroy, params: { id: template.to_param }
      expect(response).to redirect_to(templates_path)
    end
  end

end