class Coordenador < ApplicationRecord
  belongs_to :user
  belongs_to :departamento

  validates :user_id, :departamento_id, presence: true
end
