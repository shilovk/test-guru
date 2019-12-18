class Test < ApplicationRecord
  def self.titles_of_category(title)
    Test.where(category_id: title).pluck(:title).sort
  end
end
