# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @test = test_passage.test
    @user = test_passage.user

    mail to: @user.email
  end
end
