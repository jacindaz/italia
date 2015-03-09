FactoryGirl.define do 
  factory :country do 
    sequence(:english_name) { |n| "country english name #{n}"}
    sequence(:native_language_name) { |n| "country native language name #{n}"}
    description "blah blah country description blah blah"
    sequence(:country_website) { |n| "http://www.countrytest#{n}.com"}
  end
end