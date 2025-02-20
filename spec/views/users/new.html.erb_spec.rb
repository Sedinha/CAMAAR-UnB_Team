require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do
  before(:each) do
    assign(:user, User.new)
  end

  it "exibe o título da página" do
    render
    expect(rendered).to have_content("Cadastrar Conta")
  end

  it "exibe mensagens de sucesso" do
    flash[:notice] = "Conta criada com sucesso."
    render
    expect(rendered).to have_selector(".alert.alert-success", text: "Conta criada com sucesso.")
  end

  it "exibe mensagens de erro" do
    flash[:alert] = "Erro ao criar conta."
    render
    expect(rendered).to have_selector(".alert.alert-danger", text: "Erro ao criar conta.")
  end

  it "exibe o formulário de cadastro" do
    render
    expect(rendered).to have_selector("form.login-form")
  end

  it "exibe campos de entrada para username, matricula, email, password e password_confirmation" do
    render
    expect(rendered).to have_field("Nome")
    expect(rendered).to have_field("user[matricula]")
    expect(rendered).to have_field("user[email]")
    expect(rendered).to have_field("user[password]")
    expect(rendered).to have_field("user[password_confirmation]")
  end

  it "exibe um botão de submit" do
    render
    expect(rendered).to have_button("Criar Conta")
  end

  it "exibe um link para login" do
    render
    expect(rendered).to have_link("Já tem uma conta? Faça login", href: root_path)
  end


end