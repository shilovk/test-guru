# frozen_string_literal: true

class MessagesMailer < ApplicationMailer
  def contact(text, email)
    @text = text
    @email = email
    @admin = Admin.for_contact

    mail to: @admin.email if @admin.present?
  end
end
