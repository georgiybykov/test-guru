class Question < ApplicationRecord
  belongs_to :test, touch: true
  has_many :answers, dependent: :destroy
  # has_many :test_passages, dependent: :nullify
  has_many :gists, dependent: :destroy

  validates :body, presence: true
end
