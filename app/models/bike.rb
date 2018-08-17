class Bike < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :rents, dependent: :destroy
  belongs_to :user
  has_many :users, through: :rents
  validates :kind, :address, :size, :price, presence: true

  def kind_options
    [:Street, :Mountain, :Electric]
  end

  def size_options
    [:Small, :Medium, :Large]
  end

  include PgSearch
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_kind,
  against: [ :kind ],
  using: {
    tsearch: { prefix: true }
    }
  pg_search_scope :search_by_size,
  against: [ :size ],
  using: {
    tsearch: { prefix: true }
    }
end

