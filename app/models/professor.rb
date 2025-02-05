class Professor < ApplicationRecord
  has_many :professor_disciplinas
  has_many :disciplinas, through: :professor_disciplinas
  has_many :turmas
end
