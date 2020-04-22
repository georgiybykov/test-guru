class Answer < ApplicationRecord
  belongs_to :question, touch: true

  scope :correct_answer, -> { where(correct: true) }
end
