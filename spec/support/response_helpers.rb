def create_response(correct:)
  question = create :question_with_answers
  response_answer = question.answers.find_by(correct: correct)
  create :response,
         question: question,
         answer: response_answer
end