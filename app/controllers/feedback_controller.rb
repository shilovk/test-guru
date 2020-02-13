# frozen_string_literal: true

class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      @feedback.to_email
      flash[:notice] = 'Feedback was sent successfuly!'
      redirect_to user_signed_in? ? root_path : new_user_session_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body, :email, :first_name, :phone, :last_name)
  end
end
