# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 1 => :easy, 2 => :normal, 5 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end
end
