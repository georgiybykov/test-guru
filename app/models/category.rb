class Category < ApplicationRecord
  has_many :tests, dependant: :nullify
end
