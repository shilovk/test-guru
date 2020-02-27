# frozen_string_literal: true

class BadgeUser < ApplicationRecord
  default_scope { order(user_id: :asc) }

  belongs_to :badge
  belongs_to :user
end
