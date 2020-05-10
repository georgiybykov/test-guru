require 'digest/sha1'

class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', inverse_of: :author, foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, presence: true, length: { within: 2..20 }
  validates :email, presence: true, length: { within: 4..30 }
  validates :password_digest, presence: true, length: { minimum: 6 }

  has_secure_password

  def show_tests_by_level(level)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def authenticate(password_digest)
    digest(password_digest) == self.password_digest ? self : false
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
