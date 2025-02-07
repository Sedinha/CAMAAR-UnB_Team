class Turma < ApplicationRecord
  belongs_to :materia
  has_many :matriculas
  has_many :users, through: :matriculas
  has_many :questionarios

  validates :codigo, :semestre, :materia_id, presence: true
end
