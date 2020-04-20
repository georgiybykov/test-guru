class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', inverse_of: :author, foreign_key: :author_id, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  has_secure_password

  def show_tests_by_level(level)
    tests.where(level: level)
  end
end
