class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true, uniqueness: true
end
