# frozen_string_literal: true

class RenameCountToRecievedCountFromBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :badge_users, :count, :received_count
  end
end
