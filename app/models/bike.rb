class Bike < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :rents
  belongs_to :user
  has_many :users, through: :rents
  validates :kind, :address, :size, :price, presence: true

  def kind_options
    [:Street, :Mountain, :Electric]
  end

  def size_options
    [:Small, :Medium, :Large]
  end

end
