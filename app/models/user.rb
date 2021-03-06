class User < ApplicationRecord
  # user database relations
  mount_uploader :photo, PhotoUploader
  has_many :bikes, dependent: :destroy
  has_many :rents, dependent: :destroy

  def bike_rents
    renters = []
    bikes.each do |b|
      renters += b.rents
    end
    renters
  end
  # validations of user beyond basic devise
  # validates :first_name, :address, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
