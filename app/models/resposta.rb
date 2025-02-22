class Resposta < ApplicationRecord
  self.table_name = "respostas"
  belongs_to :questionario
  belongs_to :question

  validates :valor, :questao_id, :questionario_id, presence: true
end
