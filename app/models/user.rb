class User < ApplicationRecord
  has_many :bikes, through: :rents
  has_many :rents
  has_many :bikes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
