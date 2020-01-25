# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :set_test, only: :start

  rescue_from ActiveRecord::RecordNotFound do |exception|
    exception.model == 'Test' ? rescue_with_test_not_found(exception.id) : raise
  end

  def index
    @tests = Test.all
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
end
