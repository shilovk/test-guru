class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :value, default: 0
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
