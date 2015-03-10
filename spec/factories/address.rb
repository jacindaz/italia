FactoryGirl.define do
  factory :address_with_city, class: Address do 
    sequence(:address) { |n| "#{n} random street address" }
    association :city, factory: :city_with_region_country
  end
end
