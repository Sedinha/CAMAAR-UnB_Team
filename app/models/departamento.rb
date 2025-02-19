class Departamento < ApplicationRecord
  has_many :disciplinas
  has_one :coordenador

  validates :nome, presence: true
end
