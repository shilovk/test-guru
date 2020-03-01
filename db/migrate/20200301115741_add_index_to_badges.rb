# frozen_string_literal: true

class AddIndexToBadges < ActiveRecord::Migration[6.0]
  def change
    add_index :badges, %i[rule_name rule_value], unique: true
  end
end
