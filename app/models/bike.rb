class Bike < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :rents
  belongs_to :user
  has_many :users, through: :rents
  validates :kind, :address, :size, :price, presence: true
end
