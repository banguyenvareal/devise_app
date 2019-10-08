class ChangDefaultValueProvideGoogleUsers < ActiveRecord::Migration[5.2]
  def change
      change_column_default :users, :provider_google,  false
  end
end
