class ClassInfo < ApplicationRecord
  has_many :students, dependent: :destroy
  has_one :teacher, dependent: :destroy
end
