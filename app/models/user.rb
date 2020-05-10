require 'digest/sha1'

class User < ApplicationRecord
  attr_reader :password
  attr_writer :password_confirmation

  has_many :authored_tests, class_name: 'Test', inverse_of: :author, foreign_key: :author_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, presence: true, length: { within: 2..20 }
  validates :email, presence: true, length: { within: 4..30 }
  validates :password, presence: true, length: { minimum: 6 }, if: Proc.new { |u| u.password_digest.blank? }
  validates :password_confirmation, presence: true

  # has_secure_password

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    else password_digest.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  def authenticate(password_digest)
    digest(password_digest) == self.password_digest ? self : false
  end

  def show_tests_by_level(level)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
