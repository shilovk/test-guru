# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, class_name: 'Test', foreign_key: :user_id
  has_many :created_tests, class_name: 'Test', inverse_of: :author, foreign_key: 'author_id', dependent: :nullify
  has_many :gists, dependent: :destroy

  has_many :badge_receives, dependent: :destroy
  has_many :badges, through: :badge_receives, class_name: 'Badge', foreign_key: :user_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def passed_tests_by_level(level)
    test_passages.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    @admin = is_a?(Admin)
  end
end
