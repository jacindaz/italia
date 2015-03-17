class Destination < ActiveRecord::Base
  CATEGORIES = ["museum", "church", "historic building", "park", "garden", "castle", "archaelogical sight", "historic street", "historic square", "store"]

  validates :english_name, presence: true, uniqueness: { scope: :native_language_name}
  validates :category, presence: true, inclusion: { in: CATEGORIES}
  validates :cost, numericality: { only_integer: true}

  belongs_to :address

  serialize :closed_holidays, Array

  def self.categories_for_select
    Destination::CATEGORIES.map { |category| [category.titleize, category] }
  end

  def self.addresses_for_select
    Address.all.map do |address| 
      city = City.find(address.city_id)
      ["#{address.street_address}, #{city.english_name} #{address.zip}, #{city.region.country.english_name}", 
        address.id]
    end
  end

end
