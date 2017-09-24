class Response < ApplicationRecord
  belongs_to :question
  belongs_to :answer

  before_create :set_correctness
  after_create :increment_question_correct_count, if: :correct

  delegate :correct_answer, :correct_character, to: :question

  private

  def set_correctness
    self.correct = question.correct_response?(self)
  end

  def increment_question_correct_count
    question.increment!(:correct_count)
  end
end
