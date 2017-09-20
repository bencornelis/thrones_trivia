class Question < ApplicationRecord
  has_many :answers

  def self.random
    order("RANDOM()").first
  end

  def correct_answer
    answers.find_by(correct: true)
  end

  def correct_response?(response)
    response.answer == correct_answer
  end

  def correct_character
    correct_answer.character
  end
end
