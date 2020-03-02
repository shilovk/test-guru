# frozen_string_literal: true

class RemoveReceivedCountFromBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :badge_users, :received_count
  end
end
