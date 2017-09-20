require 'rails_helper'

describe 'answering a question', js: true do
  context 'the answer is correct' do
    it 'displays a success message' do
      question = create :question_with_answers

      visit question_path
      choose "response_answer_id_#{question.correct_answer.id}"
      click_on 'Submit'
      expect(page).to have_content 'You got it! Great work :)'
    end
  end

  context 'the answer is incorrect' do
    it 'displays a failure message' do
      question = create :question_with_answers

      visit question_path
      choose "response_answer_id_#{incorrect_id(question)}"
      click_on 'Submit'
      expect(page).to have_content 'Nice try, but wrong answer.'
    end

    def incorrect_id(question)
      question.answers.find_by(correct: false).id
    end
  end
end