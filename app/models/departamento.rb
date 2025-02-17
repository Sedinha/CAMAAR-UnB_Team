class Departamento < ApplicationRecord
  has_many :materias
  has_one :coordenador

  validates :nome, presence: true
end
