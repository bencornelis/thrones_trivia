require 'rails_helper'

describe 'answering a question', js: true do
  it 'shows the character that said the quote' do
    view_question_and_submit_answer

    within('#character') do
      expect(page).to have_content 'Stark #1'
    end
  end

  context 'the answer is correct' do
    it 'displays a success message' do
      view_question_and_submit_answer(correct: true)

      expect(page).to have_content 'You got it! Great work :)'
    end
  end

  context 'the answer is incorrect' do
    it 'displays a failure message' do
      view_question_and_submit_answer(correct: false)

      expect(page).to have_content 'Nice try, but wrong answer.'
    end
  end

  def view_question_and_submit_answer(correct: false)
    question = create :question_with_answers
    answer_id = question.answers.find_by(correct: correct).id

    visit question_path
    choose "response_answer_id_#{answer_id}"
    click_on 'Submit'
  end
end