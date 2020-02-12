# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[6.0]
  def self.up
    create_table :results do |t|
      t.integer :value, default: 0
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :test, null: false, foreign_key: true

      t.timestamps
    end
  end

  def self.down
    drop_table :results, if_exists: true
  end
end
