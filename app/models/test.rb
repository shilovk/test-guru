class Test < ApplicationRecord
  has_many :questions
  has_many :results
  has_many :tests, through: :results
  belongs_to :category
  belongs_to :user

  def self.titles_by_category(title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title })
  end
end
