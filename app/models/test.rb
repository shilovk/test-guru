class Test < ApplicationRecord
  def self.titles_by_category(title)
    category_id = Category.find_by(title: title).id
    joins("JOIN categories ON (tests.category_id = categories.id AND categories.id = #{category_id})")
  end
end
