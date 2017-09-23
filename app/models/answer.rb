class Answer < ApplicationRecord
  has_many :responses
  belongs_to :question
  belongs_to :character
end
