class Test < ApplicationRecord
  def self.titles_by_category(title)
    where(categories: { title: title })
    .joins("JOIN categories ON tests.category_id = categories.id")
  end
end
