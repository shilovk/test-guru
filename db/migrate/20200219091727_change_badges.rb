# frozen_string_literal: true

class ChangeBadges < ActiveRecord::Migration[6.0]
  def change
    change_table :badges do |t|
      t.rename :name, :title
      t.column :award_rule_type, :string, default: '', null: false
      t.column :award_rule_value, :integer, default: 0, null: false
    end
  end
end
