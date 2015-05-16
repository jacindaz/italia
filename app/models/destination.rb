class Destination < ActiveRecord::Base
  CATEGORIES = ["museum", "church", "historic building", "park", "garden", "castle", "archaelogical sight", "historic street", "historic square", "store", "gelateria", "coffee shop", "restaurant", "landmark", "theatre", "other", "shopping"]

  validates :english_name, presence: true, uniqueness: { scope: :native_language_name}
  validates :category, presence: true, inclusion: { in: CATEGORIES}
  validates :cost, numericality: { only_integer: true}
  
  # Paperclip ReadMe includes this line, but currently blowing up
  # attr_accessible :image    

  #  The > and # symbols will tell ImageMagick how the image 
  # will be resized (the > will proportionally reduce the size of the image)
  has_attached_file :image, 
    styles: {
      thumb: '100x100>',
      square: '200x200>',
      medium: '300x300>'
    }, 
    path: "#{Rails.env}/:class/:attachment/:id/:style.:extension",
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
  serialize :closed_holidays, Array
  
  belongs_to :address
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

  def self.category_matching(external_category)
    Destination::CATEGORIES.each do |predefined_category| 
      ext_cat = external_category.downcase
      two_way_inclusion = (ext_cat.include?(predefined_category) || predefined_category.include?(ext_cat))
      if two_way_inclusion
        return predefined_category
      end
    end
    return "other"
  end

end
