class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests_passed, through: :results, source: 'test'
  has_many :tests_created, class_name: 'Test', inverse_of: :author, foreign_key: 'author_id', dependent: :nullify

  def tests_by_level(level)
    Test.joins(:results).where(level: level)
  end
end
