class TestsController < ApplicationController
  before_action :find_test, only: %i[edit show update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test, notice: 'Test was successfully created!'
    else
      render :new
    end
  end

  def update
    if @test.update(test_params), notice: 'Test was successfully updated.'
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Test was successfully destroyed.'
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render file: 'public/404', layout: false, status: :not_found
  end
end
