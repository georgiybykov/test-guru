# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image, :description, presence: true
  validates :rule, inclusion: {
    in: Badges::CreateBadgeService::BADGE_ACHIEVEMENT_RULES.map(&:to_s),
    message: '%{value} is not a valid rule!'
  }
end
