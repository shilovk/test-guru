# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :tests, dependent: :nullify

  validates :title, presence: true
end
