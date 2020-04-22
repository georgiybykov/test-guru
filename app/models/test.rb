class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :authored_tests, foreign_key: :author_id, touch: true
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal: true }

  scope :easy_level, -> { where(level: 0..1) }
  scope :middle_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :level, -> (level) { where(level: level) }
  scope :titles_by_category, -> (category_title) { joins(:category).where( categories: {title: category_title}).order(title: :desc) }

  def self.show_titles_by_category(category_title)
    titles_by_category(category_title).pluck(:title)
  end
end
