class AddTestToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :test, null: false, foreign_key: true
  end
end
