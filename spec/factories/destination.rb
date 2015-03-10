categories = ["museum", "church", "historic building", "park", "garden", "castle", "archaelogical sight", "historic street", "historic square", "store"]
random_number = rand(0..(categories.length))
random_category = categories[random_number]

FactoryGirl.define do
  factory :destination do
    sequence(:name) { |n| "#{n} destination name #{n}" }
    category random_category
    sequence(:description) { |n| "#{n} destination description blah blah #{n}" }
    cost 10
    hours_open 9
    hours_close 5
    
    association :address, factory: :address_with_city
  end

end
