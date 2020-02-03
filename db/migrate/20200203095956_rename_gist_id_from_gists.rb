class RenameGistIdFromGists < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :gists, :gist_id, :url
    change_column :gists, :url, :string
  end

  def self.down
    change_column :gists, :url, :string, limit: 40
    rename_column :gists, :url, :gist_id
  end
end
