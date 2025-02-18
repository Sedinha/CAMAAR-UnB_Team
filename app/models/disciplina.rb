class Disciplina < ApplicationRecord
  belongs_to :departamento
  has_many :professor_disciplinas
  has_many :professores, through: :professor_disciplinas
  has_many :turmas
end
