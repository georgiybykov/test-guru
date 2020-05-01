class QuestionsController < ApplicationController

  def index
    @questions = Test.find(params[:test_id]).questions.all

    # render plain: @questions.inspect
    render inline: '<%= @questions.inspect %>'
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
