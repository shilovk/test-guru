# frozen_string_literal: true

class CreateBadgeRules < ActiveRecord::Migration[6.0]
  def up
    create_table :badge_rules, id: false do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end

  def down
    drop_table :badge_rules, if_exists: true
  end
end
