class Address < ActiveRecord::Base
  validates :address, presence: true, uniqueness: { scope: :city_id}
  validates :city_id, presence: true, numericality: { only_integer: true }

  belongs_to :city
  has_one :destination
end
