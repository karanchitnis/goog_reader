class RenameColumnGoogleAccessTokenToAccessTokenInTableUser < ActiveRecord::Migration
  def change
    rename_column :users, :google_access_token, :access_token
  end
end
