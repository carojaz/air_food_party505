class Device < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :rentals, dependent: :destroy

  has_one_attached :photo
  validates :name, :description, :price, :photo, presence: true
end
