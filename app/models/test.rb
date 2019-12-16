class Test < ApplicationRecord
  has_many :questions
  belong_to :category
  has_many :results
  has_many :users, through: :results
end
