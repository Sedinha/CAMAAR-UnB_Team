class Resposta < ApplicationRecord
  belongs_to :questionario
  belongs_to :question

  validates :valor, :questao_id, :questionario_id, presence: true
end
