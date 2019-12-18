class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level, id: results.pluck(:test_id))
  end
end
