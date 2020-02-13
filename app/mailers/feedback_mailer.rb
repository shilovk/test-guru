# frozen_string_literal: true

class FeedbackMailer < ApplicationMailer
  def feedback(feedback)
    @feedback = feedback
    @admin = Admin.for_feedback

    mail to: @admin if @admin.present?
  end
end
