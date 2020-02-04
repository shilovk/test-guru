# frozen_string_literal: true

class AddAuthorToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }, index: true
  end
end
