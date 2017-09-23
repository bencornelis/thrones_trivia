class Response < ApplicationRecord
  belongs_to :question
  belongs_to :answer

  after_create :set_correctness

  delegate :correct_answer, :correct_character, to: :question

  private

  def set_correctness
    self.correct = question.correct_response?(self)
    question.correct_count += 1 if correct
    question.save
  end
end
