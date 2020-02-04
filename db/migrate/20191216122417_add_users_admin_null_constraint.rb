# frozen_string_literal: true

class AddUsersAdminNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :admin, false)
  end
end
