class Turma < ApplicationRecord
  belongs_to :professor
  belongs_to :disciplina
  has_many :matriculas
  has_many :alunos, through: :matriculas
  has_many :questionarios

  validates :codigo, :semestre, :materia_id, presence: true
end
