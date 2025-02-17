class Materia < ApplicationRecord
  belongs_to :departamento
  has_many :turmas

  validates :nome, :codigo, :departamento_id, presence: true
end
