class Region < ActiveRecord::Base
  has_many :cities
  belongs_to :country 

  validates :country_id, presence: true, numericality: { only_integer: true }
  validates :native_language_name, presence: true, uniqueness: true

  validates :english_name, presence: true
  validates :region_website, url: true
  validates :description, length: {
    maximum: 400,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} words.",
    too_long: "must have less than %{count} words."
  }
end
