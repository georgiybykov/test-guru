require 'digest/sha1'

class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', inverse_of: :author, foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, presence: true, length: { within: 2..20 }
  validates :email, presence: true, length: { within: 4..30 }
  validates :password, presence: true, length: { minimum: 6 }, if: Proc.new { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  has_secure_password

  def show_tests_by_level(level)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
