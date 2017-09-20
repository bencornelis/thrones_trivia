module ResponsesHelper
  def answer_class(question, response, answer)
    return 'list-group-item-success' if question.correct_answer == answer
    return 'list-group-item-danger'  if response.answer == answer
    ""
  end
end
