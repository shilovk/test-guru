class Test < ApplicationRecord
  def self.titles_by_category(title)
    Category.find_by(title: title).tests.pluck(:title).sort
  end
end
