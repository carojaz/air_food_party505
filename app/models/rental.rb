class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :device
  validates :start_date, presence: true, allow_blank: false, allow_nil: false
  validates :end_date, presence: true, allow_blank: false, allow_nil: false
  validate :end_date_after_start_date
  validates :state, inclusion: { in: %w[pending validated refused] }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
