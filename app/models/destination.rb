class Destination < ActiveRecord::Base
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: ["museum", "church", "historic building", "park", "garden", "castle", "archaelogical sight", "historic street", "historic square", "store"] }
  validates :cost, numericality: { only_integer: true}
end
