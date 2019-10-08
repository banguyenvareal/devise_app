class AddProviderGoogleUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider_google, :boolean
  end
end
