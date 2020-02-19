# frozen_string_literal: true

class DropTableRules < ActiveRecord::Migration[6.0]
  def change
    drop_table :rules, if_exists: true
  end
end
