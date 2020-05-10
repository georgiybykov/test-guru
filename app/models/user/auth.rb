module User::Auth
  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :name, presence: true, length: { within: 2..20 }
    validates :email, presence: true, length: { within: 4..30 }
    validates :password, presence: true, length: { minimum: 6 }, if: Proc.new { |u| u.password_digest.blank? }
    validates :password_confirmation, presence: true
  end

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

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
