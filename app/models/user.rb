class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests_passed, through: :results, class_name: 'Test'
  has_many :tests_created, inverse_of: :author, class_name: 'Test', dependent: :nullify

  def tests_by_level(level)
    Test.joins(:results).where(level: level)
  end
end
