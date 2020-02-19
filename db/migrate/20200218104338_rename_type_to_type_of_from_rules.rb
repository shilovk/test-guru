# frozen_string_literal: true

class RenameTypeToTypeOfFromRules < ActiveRecord::Migration[6.0]
  def change
    rename_column :rules, :type, :type_of
  end
end
