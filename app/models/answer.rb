class Answer < ApplicationRecord
  belongs_to :question, touch: true
end
