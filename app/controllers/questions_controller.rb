class QuestionsController < ApplicationController
  before_action :find_test

  def index
    @questions = @test.questions.all

    # render plain: @questions.inspect
    render inline: '<%= @questions.inspect %>'
  end

  # def create
  # end

  # def new
  # end

  # def edit
  # end

  def show; end

  # def update
  # end

  # def destroy
  # end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end
end
