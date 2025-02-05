class Question < ApplicationRecord
  belongs_to :template

  enum question_type: { radio: 0, text: 1, checkbox: 2 }

  validates :title, :question_type, :content, presence: true
end
