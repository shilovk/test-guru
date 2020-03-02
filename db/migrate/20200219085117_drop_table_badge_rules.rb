# frozen_string_literal: true

class DropTableBadgeRules < ActiveRecord::Migration[6.0]
  def up
    drop_table :badge_rules, if_exists: true
  end
end
