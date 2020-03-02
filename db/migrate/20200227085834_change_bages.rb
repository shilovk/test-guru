# frozen_string_literal: true

class ChangeBages < ActiveRecord::Migration[6.0]
  def change
    change_table :badges do |t|
      t.remove :is_first_try
      t.remove :category_id
      t.remove :test_level_type

      t.string :rule_name, default: '', null: false
      t.string :rule_value, default: '', null: false

      t.index :rule_name
    end
  end
end
