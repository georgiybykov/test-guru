class User < ApplicationRecord
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :authored_tests, class_name: 'Test', inverse_of: :author, foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, presence: true, length: { within: 2..40 }
  validates :email, presence: true,
                    length: { within: 4..50 },
                    format: { with: EMAIL_FORMAT },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }

  has_secure_password

  def show_tests_by_level(level)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
