# frozen_string_literal: true

class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!
  respond_to :html

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.send

    respond_with @feedback, location: root_path, alert: 'Feedback was sent successfuly!'
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :email, :first_name, :phone, :last_name)
  end
end
