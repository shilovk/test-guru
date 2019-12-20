class AddQuestionToAnswer < ActiveRecord::Migration[6.0]
  def change
    # rubocop:disable all
    add_reference :answers, :question, null: false, foreign_key: true
    # rubocop:disable all
  end
end
