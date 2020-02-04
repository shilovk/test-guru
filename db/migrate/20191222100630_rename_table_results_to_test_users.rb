# frozen_string_literal: true

class RenameTableResultsToTestUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :results, :test_users
  end
end
