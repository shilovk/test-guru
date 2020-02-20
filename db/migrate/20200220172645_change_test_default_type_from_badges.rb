# frozen_string_literal: true

class ChangeTestDefaultTypeFromBadges < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:badges, :test_level_type, from: '', to: nil)
  end
end
