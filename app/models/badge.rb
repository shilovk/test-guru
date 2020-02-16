# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_rules
  has_many :rules, through: :badge_rules

  has_many :pictures, as: :imageable

  # validates :name, presence: true, uniqueness: { case_sensitive: false }
end
