class User < ApplicationRecord
  # has_many :providers
  has_many :user_providers, dependent: :destroy
  has_many :providers, through: :user_providers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
end
