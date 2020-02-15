# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :badges, :name, unique: true
  end
end
