# frozen_string_literal: true

class Badge < ApplicationRecord
  ACHIEVEMENT_RULES = %i[first_attempt_passed? all_tests_for_level? all_tests_for_category?].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image, :description, presence: true
  validates :rule, inclusion: {
    in: ACHIEVEMENT_RULES.map(&:to_s),
    message: :rule_validation
  }
end
