class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password

  # Relacionamentos
  has_many :matriculas
  has_many :coordenador

  # Validações
  validates :username, presence: true
  validates :matricula, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :role, presence: true

  enum role: { user: 0, admin: 1 }
end
