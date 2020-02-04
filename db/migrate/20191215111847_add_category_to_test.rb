# frozen_string_literal: true

class AddCategoryToTest < ActiveRecord::Migration[6.0]
  def change
    # rubocop:disable all
    add_reference :tests, :category, null: false, foreign_key: true
    # rubocop:disable all
  end
end
