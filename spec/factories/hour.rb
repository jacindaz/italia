random_number = rand(0..(Hour::DAYS.length - 1))
rand_hours_open = rand(0..12)
rand_hours_close = rand(13..24)

FactoryGirl.define do 
  factory :hour do 
    day_of_week Hour::DAYS[random_number]
    hours_open rand_hours_open
    hours_close rand_hours_close
    closed_entire_day "false"
  end
end