class Disciplina < ApplicationRecord
  belongs_to :departamento, optional: true
  has_many :professor_disciplinas
  has_many :professores, through: :professor_disciplinas, source: :professor
  has_many :turmas

  validates :nome, presence: true #adicionei uma validação para o nome da disciplina pois não é permitido que ele seja nulo
end
