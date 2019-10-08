class RenameProviderUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :provider, :provider_facebook
  end
end
