# frozen_string_literal: true

class AddPassedToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :passed, :boolean, default: false, null: false

    add_index :test_passages, :passed
  end
end
