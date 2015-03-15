random_number = rand(0..(Destination::CATEGORIES.length - 1))
random_cost = rand(5..40)

FactoryGirl.define do
  factory :destination_no_address, class: Destination do
    sequence(:english_name) { |n| "#{n} destination name #{n}" }
    sequence(:native_language_name) { |n| "#{n} native lang name"}
    category Destination::CATEGORIES[random_number]
    sequence(:description) { |n| "#{n} destination description blah blah #{n}" }
    destination_website "http://www.testdestination.com"
    cost random_cost
    hours "These are the destination hours"
  end

  factory :destination_with_address, class: Destination do
    sequence(:english_name) { |n| "#{n} destination name #{n}" }
    sequence(:native_language_name) { |n| "#{n} native lang name"}
    category Destination::CATEGORIES[random_number]
    sequence(:description) { |n| "#{n} destination description blah blah #{n}" }
    destination_website "http://www.testdestination.com"
    cost random_cost
    hours "These are the destination hours"
    association :address, factory: :address_with_city
  end

  # factory :destination_hour do 
  #   create(:destination)
  #   create(:hour)
  # end

  # factory :destination_hour do 
      
  #   factory :destination_for_join_table, class: Destination do 
  #     sequence(:name) { |n| "#{n} destination name for join table #{n}" }
  #     category Destination::CATEGORIES[random_number]
  #     sequence(:description) { |n| "#{n} destination description for join table blah blah #{n}" }
  #     cost random_cost
  #     association :address, factory: :address_with_city
  #   end

  #   factory :hour_for_join_table, class: Hour do 
  #     day_of_week "Tuessssday"
  #     hours_open 10
  #     hours_close 20
  #   end

  # end

end
