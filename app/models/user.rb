class User < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password

  # Relacionamentos
  belongs_to :aluno, foreign_key: "matricula", primary_key: "matricula", optional: true
  has_many :coordenador

  # Validações
  validates :username, presence: true, uniqueness: true
  validates :matricula, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :role, presence: true

 # enum role: { user: 0, admin: 1 }
  enum :role, { user: 0, admin: 1 }
  private

  def matricula_existe_no_sistema
    errors.add(:matricula, "não encontrada no sistema") unless Aluno.exists?(matricula: matricula)
  end
end
