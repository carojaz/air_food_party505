class Device < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: [:name],
                  associated_against: {
                    category: [:name]
                  },
                  associated_against: {
                    user: [:address]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :category
  belongs_to :user
  has_many :rentals, dependent: :destroy

  has_one_attached :photo
  validates :name, :description, :price, :photo, presence: true
end
