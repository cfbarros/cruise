class Bike < ApplicationRecord
  # the ActiveRecord routing for our database connections
  has_many :rents
  belongs_to :user
  has_many :users, through: :rents
end
