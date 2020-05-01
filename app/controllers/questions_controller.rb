class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all

    render plain: @questions.inspect
    # render inline: '<%= @questions.inspect %>'
  end

  def create

  end

  # def new
  # end

  # def edit
  # end

  def show
    question_with_answers = [
      "Question: #{@question.inspect}",
      "Answers: #{@question.answers.inspect}"
    ]

    render plain: question_with_answers.join("\n")
  end

  # def update
  # end

  # def destroy
  # end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
