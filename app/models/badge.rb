# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  has_one_attached :image

  validates :title, :rule_name, :rule_value, presence: true
  validates_uniqueness_of :title, case_sensitive: false
  validates_uniqueness_of :rule_name, scope: :rule_value, case_sensitive: false
  validates :rule_name, inclusion: { in: BadgeService.rules.map(&:to_s) }
end
