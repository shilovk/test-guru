class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :tests, inverse_of: :author, dependent: :nullify

  def tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
        .where(level: level, results: { user_id: id })
  end
end
