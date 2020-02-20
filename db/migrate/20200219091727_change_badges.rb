# frozen_string_literal: true

class ChangeBadges < ActiveRecord::Migration[6.0]
  def change
    change_table :badges do |t|
      t.rename :name, :title
      t.references :category
      t.column :test_level, :string, default: ''
      t.column :is_first_try, :boolean, default: false, null: false

      t.index %i[category_id test_level is_first_try], name: 'index_badges_conditions_unique', unique: true
    end
  end
end
