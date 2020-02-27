# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :tests, dependent: :nullify

  validates :title, presence: true

  def self.hash_by_id_and_title
    all.each_with_object({}) { |category, hash| hash[category.id] = category.title }
  end
end
