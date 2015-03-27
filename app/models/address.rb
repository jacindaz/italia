class Address < ActiveRecord::Base
  validates :street_address, presence: true, uniqueness: { scope: :city_id}
  validates :city_id, presence: true, numericality: { only_integer: true }

  belongs_to :city
  has_one :destination, inverse_of: :address
  accepts_nested_attributes_for :destination
end
