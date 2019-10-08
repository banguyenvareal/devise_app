class RemoveProviderUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :provider_google
    remove_column :users, :provider_facebook
  end
end
