class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :device
  validates :start_date, :end_date, presence: true
end
