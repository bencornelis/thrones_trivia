require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'has a valid factory' do
    expect(build(:question)).to be_valid
  end

  it { should have_many :answers }
  it { should have_many :responses }

  describe '.random' do
    it 'returns a question' do
      create :question

      expect(Question.random).to be_a Question
    end
  end

  describe '#correct_answer' do
    it 'is the correct answer for the question' do
      question = create :question_with_answers

      expect(question.correct_answer.correct).to be true
    end
  end

  describe '#correct_response?' do
    context 'when the response is for the correct answer' do
      it 'is true' do
        response = create_response(correct: true)

        expect(response.question.correct_response?(response)).to be true
      end
    end

    context 'when the response is for an incorrect answer' do
      it 'is false' do
        response = create_response(correct: false)

        expect(response.question.correct_response?(response)).to be false
      end
    end
  end
end
