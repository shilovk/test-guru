# frozen_string_literal: true

class RemoveIndexFromBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    remove_index :badge_users, %i[badge_id user_id]
  end
end
