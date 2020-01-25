# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    exception.model == 'Test' ? rescue_with_test_not_found(exception.id) : raise
  end

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = current_user

    if @test.save
      redirect_to admin_test_path(@test)
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

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: 'Test was been successfuly deleted'
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found(id)
    render plain: "Test #{id} was not found"
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
