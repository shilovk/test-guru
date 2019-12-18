class User < ApplicationRecord
  def tests_by_level(level)
    test_ids = Result.where(user_id: id, level: level).pluck(:id)
    Test.where(id: test_ids)
  end
end
