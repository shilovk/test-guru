# frozen_string_literal: true

class AddTimerSecondsToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :timer_seconds, :integer, default: 0
  end
end
