class Question < ApplicationRecord
  belongs_to :test, touch: true
  has_many :answers, dependent: :destroy
  # has_many :test_passages, dependent: :nullify

  validates :body, presence: true
end
