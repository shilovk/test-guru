# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_users
  has_many :users, through: :badge_users

  has_one_attached :image

  belongs_to :category, optional: true

  attribute :is_first_try, :boolean, default: false
  attribute :test_level_type, :string, default: nil

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  def self.awardings(test_passage)
    return unless test_passage.passed

    all.each do |badge|
      test_passage.user.add_badge(badge) if badge.awarded?(test_passage.user, test_passage.test)
    end
  end

  def awarded?(user, test)
    if is_first_try
      return false if TestPassage.where(test: test, user: user).count > 1
      return true if !category.present? && !test_level_type.present?
    end

    return false if category.present? && category != test.category
    return false if test_level_type.present? && test_level_type.to_sym != test.level_type

    tests_passed = user.test_passages.passed
    tests = Test.all

    if category.present?
      tests_passed = tests_passed.find_with_test_category_title(category.title)
      tests = tests.find_with_category_title(category.title)
    end

    if test_level_type.present?
      tests_passed = tests_passed.find_with_test_level_type(test_level_type.to_sym)
      tests = tests.send(test_level_type.to_sym)
    end

    tests_passed.pluck(:test_id).uniq.count == tests.count
  end
end
