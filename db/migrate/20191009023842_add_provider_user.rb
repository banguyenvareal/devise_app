class AddProviderUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :provider_id
    add_reference :providers, :user, foreign_key: true
  end
end
