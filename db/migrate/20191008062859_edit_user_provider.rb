class EditUserProvider < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_providers, :users_id
    remove_column :user_providers, :providers_id
    add_reference :user_providers, :user, foreign_key: true
    add_reference :user_providers, :provider, foreign_key: true
  end
end
