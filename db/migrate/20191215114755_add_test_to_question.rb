class AddTestToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :test, null: false, foreign_key: { to_table: :tests }
  end
end
