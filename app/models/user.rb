class User < ApplicationRecord
<<<<<<< HEAD
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
=======
  has_many :results
  has_many :users, through: :results
  has_many :tests
>>>>>>> parent of 46db6d4... fix

  def tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id')
        .where(level: level, results: { user_id: id })
  end
end
