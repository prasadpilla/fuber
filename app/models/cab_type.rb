class CabType < ActiveRecord::Base
#Columns ===> type: string, base_fare: decimal, per_mile_fare: decimal, miles_with_in_base_fare :decimal
  has_many :cabs

  validates_presence_of :cab_type
  validates_presence_of :base_fare
  validates_presence_of :per_mile_fare
end
