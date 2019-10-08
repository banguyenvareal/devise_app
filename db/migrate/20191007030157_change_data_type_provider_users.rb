class ChangeDataTypeProviderUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :provider_facebook, :boolean
  end
end
