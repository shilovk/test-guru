# frozen_string_literal: true

class RemoveBadgeUserNullConstraint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:badge_users, :badge_id, true)
    change_column_null(:badge_users, :user_id, true)
    change_column_null(:badge_users, :count, true)
  end
end
