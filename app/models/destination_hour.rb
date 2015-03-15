class DestinationHour < ActiveRecord::Base
  belongs_to :destination 
  belongs_to :hour
end