class Provider < ApplicationRecord
  # belongs_to :user
  has_many :user_providers, dependent: :destroy
  has_many :users, through: :user_providers
  validates :name, uniqueness: true
end
