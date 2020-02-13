# frozen_string_literal: true

class Admin < User
  validates :first_name, :last_name, presence: true

  def self.for_feedback
    Admin.first
  end
end
