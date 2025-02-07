class Question < ApplicationRecord
  belongs_to :template
  belongs_to :turma
  has_many :respostas
  has_many :questao_options

  enum question_type: { radio: 0, text: 1, checkbox: 2 }

  validates :title, :question_type, :content, :template_id, presence: true
end
