# frozen_string_literal: true

class RenameTableResultsToTestUsers < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :results, :test_users
  end

  def self.down
    rename_table :results, :test_users if ActiveRecord::Base.connection.data_source_exists? 'test_users'
  end
end
