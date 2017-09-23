class ResponsesController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    @response = question.responses.build(response_params)
    @response.save

    respond_to do |format|
      format.js { flash[:notice] = notice(@response) }
    end
  end

  private

  def response_params
    params.require(:response).permit(:answer_id)
  end

  def notice(response)
    response.correct ? "You got it! Great work :)" :
                       "Nice try, but wrong answer."
  end
end
