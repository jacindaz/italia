class Destination < ActiveRecord::Base
  CATEGORIES = ["museum", "church", "historic building", "park", "garden", "castle", "archaelogical sight", "historic street", "historic square", "store", "gelateria", "coffee shop", "restaurant"]

  validates :english_name, presence: true, uniqueness: { scope: :native_language_name}
  validates :category, presence: true, inclusion: { in: CATEGORIES}
  validates :cost, numericality: { only_integer: true}
  
  # Paperclip ReadMe includes this line, but currently blowing up
  # attr_accessible :image    

  has_attached_file :image, 
    # :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png",
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    dropbox_visibility: 'private'

  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  serialize :closed_holidays, Array
  
  has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true

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
