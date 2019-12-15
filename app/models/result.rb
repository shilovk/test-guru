class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test

  attribute :value, :integer, default: 0
end
