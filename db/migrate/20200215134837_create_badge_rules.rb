class CreateBadgeRules < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_rules, id: false do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
