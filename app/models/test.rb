class Test < ApplicationRecord
  def self.titles_of_category(title)
    Category.find_by(title: title).tests.pluck(:title).sort
  end
end
