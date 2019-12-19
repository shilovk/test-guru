class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level, results: { user_id: id })
        .joins("JOIN results ON tests.id = results.test_id")
  end
end
