class Materia < ApplicationRecord
  has_one :class_info, dependent: :destroy
end
