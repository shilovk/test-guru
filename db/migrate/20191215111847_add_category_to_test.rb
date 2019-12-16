class AddCategoryToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category, null: false, foreign_key: { to_table: :categories }
  end
end
