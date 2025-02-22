class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

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

  def generate_csv(results)
    CSV.generate(headers: true) do |csv|
      csv << ["Aluno", "Turma", "Nota"]
      results.each do |result|
        csv << [result.aluno.nome, result.turma.codigo, result.score]
      end
    end
  end

  def authorize_admin!
    redirect_to root_path, alert: "Acesso negado!" unless current_user.admin?
  end
end
