class Disciplina < ApplicationRecord
  has_many :professor_disciplinas
  has_many :professores, through: :professor_disciplinas
  has_many :turmas
end
