class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', inverse_of: :created_tests, optional: true
  has_many :questions, dependent: :destroy
  has_many :test_users, dependent: :destroy
  has_many :users, through: :test_users

  def self.titles_by_category(title)
    joins(:category).where(categories: { title: title })
  end
end
