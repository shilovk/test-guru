# frozen_string_literal: true

class ChangeTestsLevelColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, from: nil, to: 1)
  end
end
