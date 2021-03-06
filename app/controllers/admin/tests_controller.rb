# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update update_inline destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.authored_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.test_created')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.test_updated')
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: t('.test_deleted')
  end

  def start
    current_user.tests.push(@test)

    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params
      .require(:test)
      .permit(:title, :level, :category_id, :author_id, :passage_time)
      .tap { |params| params[:level] = params[:level]&.to_i }
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end

  def rescue_with_test_not_found
    render file: 'public/404', layout: false, status: :not_found
  end
end
