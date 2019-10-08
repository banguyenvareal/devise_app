class RemoveUserIdFromProvider < ActiveRecord::Migration[5.2]
  def change
    remove_column :providers, :users_id
  end
end
