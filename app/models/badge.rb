# frozen_string_literal: true

class Badge < ApplicationRecord
  enum rule: {
    first_attempt_passed?: 'first_attempt_passed?',
    all_tests_for_level?: 'all_tests_for_level?',
    all_tests_for_category?: 'all_tests_for_category?'
  }.freeze

  mount_uploader :logo, LogoUploader

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :rule, :description, presence: true
end
