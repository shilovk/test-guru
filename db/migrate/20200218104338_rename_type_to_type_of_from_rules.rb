# frozen_string_literal: true

class RenameTypeToTypeOfFromRules < ActiveRecord::Migration[6.0]
  def up
    rename_column :rules, :type, :type_of if ActiveRecord::Base.connection.column_exists?(:rules, :type)
  end

  def down
    rename_column :rules, :type_of, :type if ActiveRecord::Base.connection.column_exists?(:rules, :type_of)
  end
end
