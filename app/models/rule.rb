# frozen_string_literal: true

class Rule < ApplicationRecord
  has_many :badge_rules
  has_many :badges, through: :badge_rules

  validates :name, :type, :need_pass, :attempt, precense: true
  validates :need_pass, :attempt, numericality: { only_integer: true }
  validates :name, uniqueness: { case_sensitive: false }
end
