# frozen_string_literal: true

class Badge < ApplicationRecord
  has_many :badge_users, dependent: :nullify
  has_many :users, through: :badge_users

  has_one_attached :image

  belongs_to :category, optional: true

  attribute :is_first_try, :boolean, default: false
  attribute :test_level, :string, default: ''

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  def self.awardings!(user, test)
    Badge.all.each { |badge| user.add_badge(badge) if badge.awarded?(user, test) }
  end

  def awarded?(user, test)
    tests_passed = user.test_passage.passed
    tests = Test.all

    if category && category == test.category
      tests_passed = tests_passed.find_passed_with_category_title(category.title)
      tests = tests.find_with_category_title(category.title)
    end

    if test_level.present? && test_level.to_s == test.test_level(level)
      tests_passed = tests_passed.find_passed_with_test_level(test_level).pluck(:test_id)
      tests = tests.find_with_level(test_level)
    end

    tests_passed_count = tests_passed.count
    tests_passed_uniq_count = tests_passed.uniq.count

    return false if is_first_try && tests_passed_count != tests_passed_uniq_count

    tests_passed_uniq_count == tests.count
  end
end
