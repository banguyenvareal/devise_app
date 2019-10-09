class AddIndexToUserProvider < ActiveRecord::Migration[5.2]
  def change
    add_index :user_providers, [:user_id, :created_at], unique: true
  end
end
