class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', inverse_of: :author, foreign_key: :author_id, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  validates :name, presence: true, length: { within: 2..20 }
  validates :email, presence: true, length: { within: 4..30 }
  validates :password_digest, presence: true, length: { minimum: 6 }

  has_secure_password

  def show_tests_by_level(level)
    tests.level(level)
  end
end
