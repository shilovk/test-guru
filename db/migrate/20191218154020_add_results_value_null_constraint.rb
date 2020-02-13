# frozen_string_literal: true

class AddResultsValueNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:results, :value, false) if ActiveRecord::Base.connection.data_source_exists? 'results'
  end
end
