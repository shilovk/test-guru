class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :value, default: 0
      t.belongs_to :user, null: false, foreign_key: { to_table: :users }
      t.belongs_to :test, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
