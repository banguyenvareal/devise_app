class RemoveUserProvider < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :providers_id
  end
end
