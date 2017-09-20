require 'rails_helper'

RSpec.describe Response, type: :model do
  it 'has a valid factory' do
    expect(build(:response)).to be_valid
  end

  it { should belong_to :question }
  it { should belong_to :answer }

  describe 'creating a response' do
    context 'when the response is correct' do
      let(:response) { create_response(correct: true) }

      it 'sets correct to true' do
        expect(response.correct).to be true
      end

      it 'increments the correct count for the question' do
        expect(response.question.correct_count).to eql 1
      end
    end

    context 'when the response is not correct' do
      let(:response) { create_response(correct: false) }

      it 'sets correct to false' do
        expect(response.correct).to be false
      end

      it 'does not increment the correct count for the question' do
        expect(response.question.correct_count).to eql 0
      end
    end
  end
end
