class Destination < ActiveRecord::Base
  CATEGORIES = ["museum", "church", "historic building", "park", "garden", "castle", "archaelogical sight", "historic street", "historic square", "store"]

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES}
  validates :cost, numericality: { only_integer: true}

  def self.categories_for_select
    Destination::CATEGORIES.map { |category| [category.titleize, category] }
  end

end
