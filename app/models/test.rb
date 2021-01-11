# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :authored_tests, foreign_key: :author_id, touch: true
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :category, presence: true

  scope :easy_level, -> { where(level: 0..1) }
  scope :middle_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :with_level, ->(level) { where(level: level) }
  scope :for_category, ->(category_id) { where(category_id: category_id) }

  def self.by_category_titles(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
  end

  def self.show_category_title(category_title)
    by_category_titles(category_title).pluck(:title)
  end
end
