class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(id: results.where(level: level).pluck(:id))
  end
end
