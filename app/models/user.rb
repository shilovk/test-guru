class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level, id: results.pluck(:test_id))
  end

  def tests_by_level_alternate(level)
    Test.find_each(batch_size: 100)
        .joins(:resuts)
        .where(tests: { level: level })
        .where(results: { test_id: 'tests.id', user_id: id })
  end
end
