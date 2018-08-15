class User < ApplicationRecord
  # user database relations
  has_many :bikes, through: :rents
  has_many :rents
  has_many :bikes, dependent: :destroy
  # validations of user beyond basic devise
  # validates :first_name, :location, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
