class QuestionsController < ApplicationController
  def show
    @question = Question.random
  end
end
