class ResponsesController < ApplicationController
  def show
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
  end

  def create
    question = Question.find(params[:question_id])
    response = Response.create(response_params)

    redirect_to question_response_path(question, response),
                notice: notice(response)
  end

  private

  def response_params
    params.require(:response)
      .permit(:answer_id).merge(params.permit(:question_id))
  end

  def notice(response)
    response.correct ? "You got it! Great work :)" :
                       "Nice try, but wrong answer."
  end
end
