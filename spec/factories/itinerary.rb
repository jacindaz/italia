FactoryGirl.define do 
  factory :itinerary do 
    sequence(:name) { |n| "itinerary name #{n}"}
  end
end