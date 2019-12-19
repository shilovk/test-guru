class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level)
        .joins("JOIN results
                ON (tests.id = results.test_id
                AND results.user_id = #{id})")
  end
end
