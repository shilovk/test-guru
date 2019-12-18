class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(user: self, level: level)
  end
end
