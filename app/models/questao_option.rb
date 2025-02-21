class QuestaoOption < ApplicationRecord
  belongs_to :question

  validates :nome, :texto, :question_id, presence: true #alteração feita para passar no teste estava questao.id e não question_id
end
