FactoryGirl.define do 
  factory :city do
    sequence(:english_name) { |n| "city english name #{n}"}
    sequence(:native_language_name) { |n| "city native language name #{n}"}
    description "blah blah city description blah blah"
    is_capital false
    sequence(:city_website) { |n| "http://www.citytest#{n}.com"}
  end

  factory :city_with_region_country, class: City do 
    sequence(:english_name) { |n| "city with region country english name #{n}"}
    sequence(:native_language_name) { |n| "city with region country native language name #{n}"}
    description "blah blah city description blah blah"
    is_capital false
    sequence(:city_website) { |n| "http://www.citytest#{n}.com"}
    association :region, factory: :region_with_country
  end
end