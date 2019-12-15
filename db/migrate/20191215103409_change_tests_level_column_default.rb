class ChangeTestsLevelColumnDefault < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up   { change_column_default(:tests, :level, 1) }
      dir.down { change_column_default(:tests, :level, nil) }
    end
  end
end
