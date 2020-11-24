class Device < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :rentals, dependent: :destroy

  has_many_attached :pictures
  validates :name, :description, :price, presence: true
end
