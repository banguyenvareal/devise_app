class AddUserProviderToTempt < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_providers, :users, foreign_key: true
    add_reference :user_providers, :providers, foreign_key: true
  end
end
