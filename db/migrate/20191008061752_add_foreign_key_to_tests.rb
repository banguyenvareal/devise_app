class AddForeignKeyToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :users, foreign_key: true
    add_reference :tests, :providers, foreign_key: true
  end
end
