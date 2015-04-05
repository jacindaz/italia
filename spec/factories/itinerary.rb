FactoryGirl.define do 
  factory :itinerary do 
    sequence(:name) { |n| "itinerary name #{n}"}
  end

  factory :itinerary_with_city, parent: :itinerary do |itinerary| 
    sequence(:name) { |n| "itinerary name with city #{n}"} 

    after(:create) do |itinerary_with_city|
      itinerary_with_city.cities << FactoryGirl.create(:city_with_region_country)
    end
  end
end