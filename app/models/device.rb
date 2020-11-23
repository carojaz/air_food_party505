class Device < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :rentals, dependent: :destroy

  has_many_attached :photos
  validates :name, :description, :price, presence: true
end
