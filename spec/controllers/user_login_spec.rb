require 'rails_helper'

RSpec.feature "User Login", type: :feature do
  scenario "User signs up successfully" do
    visit new_user_path

    fill_in "Nome", with: "Test User"
    fill_in "Matrícula", with: "123456"
    fill_in "E-mail", with: "test@example.com"
    fill_in "Senha", with: "password123"
    fill_in "Confirmação de senha", with: "password123"

    click_button "Criar Conta"

    expect(page).to have_content("Usuário criado com sucesso!")
  end

  scenario "User logs in successfully" do
    user = create(:user, password: "password123")

    visit login_path
    fill_in "Matrícula", with: user.matricula
    fill_in "Senha", with: "password123"
    click_button "Entrar"

    expect(page).to have_content("Login efetuado com sucesso!")
  end

  scenario "Admin logs in successfully" do
    admin = create(:user, :admin, password: "password123")

    visit login_path
    fill_in "Matrícula", with: admin.matricula
    fill_in "Senha", with: "password123"
    click_button "Entrar"

    expect(page).to have_content("Login efetuado com sucesso!")
  end

  scenario "User cannot log in with invalid credentials" do
    visit login_path
    fill_in "Matrícula", with: "wrong"
    fill_in "Senha", with: "wrong"
    click_button "Entrar"

    expect(page).to have_content("Matrícula ou senha inválidos")
  end
end
