class AddUserToProvider < ActiveRecord::Migration[5.2]
  def change
    add_reference :providers, :users, foreign_key: true
  end
end
