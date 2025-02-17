class QuestaoOption < ApplicationRecord
  belongs_to :question

  validates :nome, :texto, :questao_id, presence: true
end
