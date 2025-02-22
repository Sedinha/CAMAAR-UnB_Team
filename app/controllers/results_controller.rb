class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!


  def results_page
  end

  # Exporta os resultados dos alunos em um arquivo CSV
  def export
    @results = Result.includes(:student).all

    respond_to do |format|
      format.csv do
        send_data generate_csv(@results),
                  filename: "resultados.csv",
                  type: "text/csv"
      end
    end
  end

  private

  # Função auxiliar para gerar o arquivo CSV usada no método export
  def generate_csv(results)
    CSV.generate(headers: true) do |csv|
      csv << ["Aluno", "Turma", "Nota"]
      results.each do |result|
        csv << [result.student.name, result.student.class_info.code, result.score]
      end
    end
  end

  def authorize_admin!
    redirect_to root_path, alert: "Acesso negado!" unless current_user.admin?
  end
end
