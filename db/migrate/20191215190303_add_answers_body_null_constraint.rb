# frozen_string_literal: true

class AddAnswersBodyNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :body, false)
  end
end
