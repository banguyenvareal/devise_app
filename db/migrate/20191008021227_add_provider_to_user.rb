class AddProviderToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :providers, foreign_key: true
  end
end
