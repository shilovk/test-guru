class RenamePasswordDigistFromUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :password_digist, :password_digest
  end
end
