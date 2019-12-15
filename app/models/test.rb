class Test < ApplicationRecord
  has_many :questions
  belong_to :category
  has_many :results
  has_many :users, through: :results

  validates :title, presence: true

  attribute :level, :integer, default: 1
  attribute :published, :boolean, default: false
end
