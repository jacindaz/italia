class City < ActiveRecord::Base
  belongs_to :region

  has_one :itinerary, through: :itinerary_city 
  has_one :itinerary_city

  validates :region_id, presence: true, numericality: { only_integer: true }
  validates :native_language_name, presence: true, uniqueness: true

  validates :english_name, presence: true, uniqueness: true
  validates :city_website, url: true
  validates :description, length: {
    maximum: 400,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} words.",
    too_long: "must have less than %{count} words."
  }

  def destinations
    destinations = []
    Destination.all.includes(:address, address: [:city]).each do |d|
      if d.address.city == self
        destinations << d
      end
    end
    destinations
  end

end