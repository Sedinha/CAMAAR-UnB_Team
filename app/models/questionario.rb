class Questionario < ApplicationRecord
  belongs_to :template
  belongs_to :turma
  has_many :respostas, dependent: :destroy
  has_many :respondidos, dependent: :destroy

  validates :nome, :turma_id, :template_id, :publico_alvo, presence: true
end
