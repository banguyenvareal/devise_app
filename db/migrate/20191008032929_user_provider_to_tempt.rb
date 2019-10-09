class UserProviderToTempt < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :user_providers, foreign_key: true
    add_reference :providers, :user_providers, foreign_key: true
  end
end
