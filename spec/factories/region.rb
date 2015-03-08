FactoryGirl.define do 
  factory :region do 
    sequence(:english_name) { |n| "english name #{n}"}
    sequence(:native_language_name) { |n| "native language name #{n}"}
    description "blah blah region description blah blah"
    sequence(:region_website) { |n| "http://www.regiontest#{n}.com"}
  end
end