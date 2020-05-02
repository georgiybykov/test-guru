class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions

    render plain: @questions.inspect
    # render inline: '<%= @questions.inspect %>'
  end

  def create
    if @test.questions.create(question_params)
      redirect_to test_questions_path(@test)
    else
      render plain: @test.errors.massages
    end
  end

  def new; end

  def show
    question_with_answers = [
      "Question: #{@question.inspect}",
      "Answers: #{@question.answers.inspect}"
    ]

    render plain: question_with_answers.join("\n")
  end

  def destroy
    @question.destroy

    render plain: 'Question has been deleted successfully!'
    # render html: '<h1>Question has been deleted successfully!</h1>'.html_safe
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
