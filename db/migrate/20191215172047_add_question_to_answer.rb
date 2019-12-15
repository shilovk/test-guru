class AddQuestionToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :question, null: false, foreign_key: { to_table: :questions }
  end
end
