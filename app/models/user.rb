class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results

  validates :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  validates :email, confirmation: true
  validates :email_confirmation, presence: true
end
