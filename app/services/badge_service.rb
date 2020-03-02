# frozen_string_literal: true

# BadgeService
class BadgeService
  RULES = %w[tests_of_category tests_of_level test_of_try].freeze

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @test_passed = test_passage.result_success?
    @tests_passed = @user.test_passages.passed
  end

  class << self
    def rules
      RULES
    end

    def values_of_rule(rule)
      send rule
    end

    private

    def tests_of_category
      Category.all.pluck(:title)
    end

    def tests_of_level
      Test::LEVEL_TYPES
    end

    def test_of_try
      [1, 2, 3, 4, 5]
    end
  end

  def badges
    Badge.all.select { |badge| award?(badge) }
  end

  private

  def award?(badge)
    send badge.rule_name, badge
  end

  def tests_of_category(badge)
    return false if @test_passed == false
    return false if @test.category.title != badge.rule_value

    count_of_passed(@tests_passed.find_with_test_category_title(badge.rule_value), Test.find_with_category_title(badge.rule_value))
  end

  def tests_of_level(badge)
    return false if @test_passed == false
    return false if @test.level_type != badge.rule_value

    count_of_passed(@tests_passed.find_with_test_level_type(badge.rule_value), Test.send(badge.rule_value))
  end

  def count_of_passed(test_passed, tests)
    (test_passed.pluck(:test_id, :user_id).uniq.count % tests.count).zero?
  end

  def test_of_try(badge)
    return false if @test_passed == false

    @tests_passed.where(test: @test).count == badge.rule_value.to_i
  end
end
