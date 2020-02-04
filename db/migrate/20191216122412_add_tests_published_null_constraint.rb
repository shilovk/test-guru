# frozen_string_literal: true

class AddTestsPublishedNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :published, false)
  end
end
