# frozen_string_literal: true

class CreateBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_users do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :count, default: 0, null: false
    end
  end
end
