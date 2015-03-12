 class Hour < ActiveRecord::Base

  DAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

  validates :day_of_week, presence: true, inclusion: { in: DAYS }
  validates :closed_entire_day, presence: true, inclusion: { in: [true, false] }
  validates :hours_open, inclusion: { in: 0..24 }
  validates :hours_close, inclusion: { in: 0..24 }

end