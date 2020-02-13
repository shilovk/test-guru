# frozen_string_literal: true

class Feedback
  include ActiveModel::Model

  attr_accessor :body, :email, :first_name, :phone, :last_name

  validates :body, :first_name, presence: true
  validates :email, presence: true, format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }

  def to_email
    FeedbackMailer.feedback(self).deliver_now
  end

end
