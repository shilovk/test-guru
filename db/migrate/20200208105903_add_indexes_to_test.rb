# frozen_string_literal: true

class AddIndexesToTest < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, %i[title level], unique: true
  end
end
