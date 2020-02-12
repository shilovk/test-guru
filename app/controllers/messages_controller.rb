class MessagesController < ApplicationController
  # frozen_string_literal: true

  def contact
    if params[:text].present? && params[:email].present?
      MessagesMailer.contact(params[:text], params[:email]).deliver_now
      redirect_to root_path, alert: 'Message to Admin sent successfuly!'
    else
      render :contact, params
    end
  end
end
