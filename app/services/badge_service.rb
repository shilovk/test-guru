# frozen_string_literal: true

# BadgeService
class BadgeService
  RULES = { tests_of_category: Category.all.pluck(:title), tests_of_level: Test::LEVEL_TYPES, test_of_try: [1, 2, 3, 4, 5] }.freeze

  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @tests_passed = @user.test_passages.passed
  end

  def self.rules
    RULES.keys
  end

  def self.values_of_rule(rule)
    RULES[rule]
  end

  def badges
    Badge.all.each_with_object([]) do |badge, badges|
      badges << badge if award?(badge)
    end
  end

  private

  def award?(badge)
    send badge.rule_name(badge)
  end

  def tests_of_category(badge)
    return false if @user.badges.include? badge

    @tests_passed.find_with_test_category_title(badge.rule_value).uniq.count == Test.find_with_category_title(badge.rule_value).count
  end

  def tests_of_level(badge)
    return false if @user.badges.include? badge

    @tests_passed.find_with_test_level_type(badge.rule_value) == Test.send(badge.rule_value).count
  end

  def test_of_try(badge)
    @tests_passed.where(test: @test).count == badge.rule_value
  end
end
