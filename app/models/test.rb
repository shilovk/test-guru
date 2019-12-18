class Test < ApplicationRecord
  def self.titles_by_category(title)
    Category.find_by(title: title).tests.pluck(:title).sort
  end

  def self.titles_by_category_alternate(title)
    Test.find_each(batch_size: 100)
        .joins(:categories)
        .where(tests: { category_id: Category.find_by(title: title).id })
        .order('tests.title')
        .pluck('tests.title')
  end
end
