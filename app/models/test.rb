class Test < ApplicationRecord
  def self.titles_by_category(title)
    joins("JOIN categories ON tests.category_id = categories.id")
    .where(categories: { title: title })
  end
end
