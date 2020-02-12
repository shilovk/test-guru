# frozen_string_literal: true

class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :contact

  def contact
    if params[:text].present? && params[:email].present?
      MessagesMailer.contact(params[:text], params[:email]).deliver_now
      redirect_to root_path, alert: 'Message to Admin sent successfuly!'
    else
      render :contact, params
    end
  end
end
