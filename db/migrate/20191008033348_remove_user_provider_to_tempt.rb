class RemoveUserProviderToTempt < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_providers_id
    remove_column :providers, :user_providers_id
  end
end
