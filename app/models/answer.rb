class Answer < ApplicationRecord
  belongs_to :question, touch: true

  validates :body, presence: true
  validate :limited_quantity_of_answers, on: :create

  scope :correct_answer, -> { where(correct: true) }

  def limited_quantity_of_answers
    errors.add(:question, 'too much answers (1..4)') if question.answers.count >= 4
  end
end
