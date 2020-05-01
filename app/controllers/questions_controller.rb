class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show]

  def index
    @questions = @test.questions.all

    render plain: @questions.inspect
    # render inline: '<%= @questions.inspect %>'
  end

  # def create
  # end

  # def new
  # end

  # def edit
  # end

  def show
    render plain: @question.inspect
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
end
