class AddPasswordDigistToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digist, :string
  end
end
