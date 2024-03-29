# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_PERCENTAGE = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true, inverse_of: :test_passages

  before_validation :set_next_question

  scope :by_user_id, ->(user_id) { where(user_id: user_id) }
  scope :successfully_passed, -> { where('result >= ?', SUCCESS_PERCENTAGE) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    finish_passage! if self.test.with_timer? && time_is_over?
    self.result = percent_result

    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def success?
    percent_result >= SUCCESS_PERCENTAGE
  end

  def percent_result
    correct_questions * 100 / questions_count
  end

  def passage_progress
    100 / questions_count * (current_question_number - 1)
  end

  def questions_count
    test.questions.count
  end

  private

  def set_next_question
    self.current_question = if new_record?
                              test.questions.order(:id).first if test.present?
                            else
                              # Disabling the Rubocop's rule is just to save this studying example of the code.
                              test.questions.order(:id).where('id > ?', current_question&.id).first
                            end
  end

  def correct_answer?(answer_ids)
    return unless answer_ids

    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def finish_passage!
    self.current_question = nil
  end

  def time_is_over?
    finish_at = created_at + self.test.passage_time

    Time.current >= finish_at
  end
end
