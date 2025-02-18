class Respondido < ApplicationRecord
  belongs_to :questionario
  belongs_to :user

  validates :questionario_id, :user_id, presence: true
end
