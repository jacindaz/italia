class Address < ActiveRecord::Base
  validates :address, presence: true
  validates :city_id, presence: true, numericality: { only_integer: true }
  validates :destination_id, uniqueness: { scope: [:cafe_id, :restaurant_id] }
end
