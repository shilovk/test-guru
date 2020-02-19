# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_receives
  has_many :users, through: :badge_receives

  has_one_attached :image

  validates :title, :award_rule_type, :award_rule_value, presence: true
  validates :title, uniqueness: { case_sensitive: false }
  validates :award_rule_value, numericality: { only_integer: true, greater_than: -1 }
end
