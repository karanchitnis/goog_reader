class AddColumnAccessTokenExpiredAt < ActiveRecord::Migration
  def change
    add_column :users, :access_token_expired_at, :datetime
    add_column :users, :refresh_token, :string
  end
end
