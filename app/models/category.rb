class Category < ApplicationRecord
  has_many :devices, dependent: :destroy
end
