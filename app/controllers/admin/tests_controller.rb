# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy start update_inline]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    exception.model == 'Test' ? rescue_with_test_not_found(exception.id) : raise
  end

  def index; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
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

    redirect_to admin_tests_path, notice: t('.success')
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found(id)
    render plain: "Test #{id} was not found"
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id, 'timer_value(4i)', 'timer_value(5i)', 'timer_value(6i)')
  end
end
