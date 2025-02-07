class Aluno < ApplicationRecord
  has_many :matriculas
  has_many :turmas, through: :matriculas
end
