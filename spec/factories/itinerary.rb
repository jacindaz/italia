FactoryGirl.define do 
  factory :itinerary do 
    sequence(:name) { |n| "itinerary name #{n}"}
  end

  factory :itinerary_city do 
    itinerary 
    city
  end
end