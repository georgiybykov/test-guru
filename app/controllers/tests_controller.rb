class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update]

  def index
    @tests = Test.all
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def new
    @test = Test.new
  end

  def edit; end

  def show; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
