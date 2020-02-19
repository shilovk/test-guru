# frozen_string_literal: true

class RenameBadgeUsersToBadgeReceives < ActiveRecord::Migration[6.0]
  def change
    rename_table :badge_users, :badge_receives
  end
end
