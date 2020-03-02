# frozen_string_literal: true

class AddIndexesToBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :badge_users, %i[badge_id user_id], unique: true
  end
end
