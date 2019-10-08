class AddUidGoogleUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid_google, :string
  end
end
