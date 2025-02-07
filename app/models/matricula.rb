class Matricula < ApplicationRecord
  belongs_to :user
  belongs_to :turma

  validates :user_id, :turma_id, presence: true
end
