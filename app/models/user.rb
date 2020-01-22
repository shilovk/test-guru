require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, class_name: 'Test', foreign_key: :user_id
  has_many :created_tests, class_name: 'Test', inverse_of: :author, foreign_key: 'author_id', dependent: :nullify

  validates :email, presence: true # , email: true

  def passed_tests_by_level(level)
    test_passages.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
