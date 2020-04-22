class Answer < ApplicationRecord
  belongs_to :question, touch: true

  validates :body, presence: true
  validate :limited_number_of_answers

  scope :correct_answer, -> { where(correct: true) }

  def limited_number_of_answers
    errors.add(:question, 'more than 4 answers') if question.answers.count > 4
  end
end
