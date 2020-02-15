# frozen_string_literal: true

class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :name, default: '', null: false
      t.string :type, default: '', null: false
      t.integer :need_pass, default: 0, null: false
      t.integer :attempt, default: 0, null: false

      t.timestamps
    end

    add_index :rules, :name, unique: true
  end
end
