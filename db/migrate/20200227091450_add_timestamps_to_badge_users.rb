# frozen_string_literal: true

class AddTimestampsToBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :badge_users do |t|
      t.timestamps default: Time.current
      t.change_default :created_at, from: Time.current, to: nil
      t.change_default :updated_at, from: Time.current, to: nil
    end
  end
end
