class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :devices
  has_many :rentals
  has_one_attached :photo

  validates :first_name, :last_name, :address, :phone_number, presence: true
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
