# frozen_string_literal: true

class BadgeRule < ApplicationRecord
  belongs_to :badge
  belongs_to :user
end
