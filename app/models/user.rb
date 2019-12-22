class User < ApplicationRecord
  has_many :test_users, dependent: :destroy
  has_many :passed_tests, through: :test_users, source: 'test'
  has_many :created_tests, class_name: 'Test', inverse_of: :author,
           foreign_key: 'author_id', dependent: :nullify

  def passed_tests_by_level(level)
    passed_tests.where(level: level)
  end
end
