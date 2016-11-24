class Cab < ActiveRecord::Base
#Columns ====> cab_model: string, reg_no: string, color: string
	acts_as_geolocated

  belongs_to :cab_type
  has_one :driver
  has_many :bookings

  validates_presence_of :model
  validates_presence_of :reg_no
  validates_presence_of :color
end
