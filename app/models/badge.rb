# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  has_one_attached :image

  validates :title, :rule_name, :rule_value, presence: true
  validates :title, uniqueness: { case_sensitive: false }
end
