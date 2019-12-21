class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, inverse_of: :tests, optional: true
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.titles_by_category(title)
    joins(:categories).where(categories: { title: title })
  end
end
