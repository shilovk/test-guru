# frozen_string_literal: true

class Admin < User
  validates :first_name, :last_name, presence: true

  def self.for_contact
    Admin.first
  end
end
