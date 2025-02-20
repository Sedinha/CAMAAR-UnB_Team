require 'rails_helper'

RSpec.describe "users/dashboard.html.erb", type: :view do
  it "exibe o título da página" do
    render
    expect(rendered).to have_content("Dashboard do Usuário")
  end

  it "exibe o conteúdo do dashboard" do
    render
    expect(rendered).to have_selector(".dashboard-content")
  end
end