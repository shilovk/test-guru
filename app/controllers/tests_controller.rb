# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

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

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path, notice: 'Test was been successfuly deleted'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found(id)
    render plain: "Test #{id} was not found"
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end