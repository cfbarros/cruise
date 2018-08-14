class Bike < ApplicationRecord
  has_many :rents
  belongs_to :user
  has_many :users, through: :rents
  validates :kind, :brand, :location, :size, :price, presence: true
end
