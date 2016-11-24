class Booking < ActiveRecord::Base
#Columns ===> booking_code: string, start_time: datetime, end_time: datetime, status: integer, source: float, destination: float
  belongs_to :cab
  belongs_to :user

  validates_presence_of :source
  validates_presence_of :destination
end
