class Country < ActiveRecord::Base
  has_many :regions

  validates :native_language_name, presence: true, uniqueness: true
  
  validates :english_name, presence: true
  validates :country_website, url: true
  validates :description, length: {
    maximum: 400,
    tokenizer: lambda { |str| str.scan(/\w+/) },
    too_short: "must have at least %{count} words.",
    too_long: "must have less than %{count} words."
  }
end
