class RenameUidUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :uid, :uid_facebook
  end
end
