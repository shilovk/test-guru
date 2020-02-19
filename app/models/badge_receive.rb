# frozen_string_literal: true

class BadgeReceive < ApplicationRecord
  belongs_to :badge
  belongs_to :user

  validates :count, numericality: { only_integer: true }
end
