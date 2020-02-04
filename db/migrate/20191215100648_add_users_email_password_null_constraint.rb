# frozen_string_literal: true

class AddUsersEmailPasswordNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :email, false)
    change_column_null(:users, :password, false)
  end
end
