class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  belongs_to :category

  def self.titles_by_category(title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: title })
  end
end
