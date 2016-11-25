class Booking < ActiveRecord::Base
#Columns ===> booking_code: string, start_time: datetime, end_time: datetime, status: integer, source: float, destination: float
  belongs_to :cab
  belongs_to :user

  validates_presence_of :source_lat
  validates_presence_of :source_lng
  validates_presence_of :destination_lat
  validates_presence_of :destination_lng

  enum status: [ :booked, :completed,:cancelled ]


  def calculate_distance
    Geocoder::Calculations.distance_between([source_lat,source_lng],[destination_lat,destination_lng]).round(2)
  end

  def calculate_fare
  	cab_type = self.cab.cab_type
    ride_time_minutes = ((end_time - start_time)/60).round(2)
  	distance = calculate_distance
    (cab_type.base_fare + ((distance-cab_type.miles_with_in_base_fare) * cab_type.per_mile_fare)+ride_time_minutes * cab_type.per_minute_fare).round(2)
  end


end
