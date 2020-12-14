# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_PERCENTAGE = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true, inverse_of: :test_passages

  before_validation :set_next_question

  # scope :passed, -> { where('result >= ?', SUCCESS_PERCENTAGE) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.result = percent_result

    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def questions_count
    test.questions.count
  end

  def percent_result
    correct_questions * 100 / questions_count
  end

  def success?
    percent_result >= SUCCESS_PERCENTAGE
  end

  def passage_progress
    100 / questions_count * (current_question_number - 1)
  end

  private

  def set_next_question
    self.current_question = if new_record?
                              test.questions.order(:id).first if test.present?
                            else
                              # Disabling the Rubocop's rule is just to save this studying example of the code
                              test.questions.order(:id).where('id > ?', current_question.id).first # rubocop:disable Rails/FindBy
                            end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
