class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results

  validates :email, :password, presence: true
end
