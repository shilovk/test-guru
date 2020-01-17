# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :normal, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_header(test)
    test.persisted? ? 'Edit Test' : 'Create New Test'
  end
end
