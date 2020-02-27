# frozen_string_literal: true

class AddIndexBadgeUserToBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :badge_users, %i[badge_id user_id]
  end
end
