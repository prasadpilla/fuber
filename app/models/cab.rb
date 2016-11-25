class Cab < ActiveRecord::Base
#Columns ====> cab_model: string, reg_no: string, color: string
	acts_as_geolocated

enum status: [ :available, :archived ]

belongs_to :cab_type
has_one :driver
has_many :bookings

validates_presence_of :cab_model
validates_presence_of :reg_no
validates_presence_of :color

  #Find nearby cabs using earthdistance gem methods
  def self.find_cabs_around(point,cab_type_id)
  	within_radius(1000, *point).order_by_distance(*point).where(cab_type_id:cab_type_id,available:true).limit(100)
  end

  #This is just a alternate method to find cabs with in radius by useing the Postgresql's Geo spatial search mechanism "PostGIS"
  def self.find_cabs_alternate_method(point, cab_type_id)
  	lat,lng = point[0],point[1]

  	cab_ids = find_by_sql ["SELECT id, (3959 * acos (
  		cos(radians(?))
  		* cos(radians(latitude))
  		* cos(radians(longitude) - radians(?))
  		+ sin(radians(?))
  		* sin(radians(latitude))
  		)
  		) AS distance FROM Drivers ORDER BY (3959 * acos (
  		cos(radians(?))
  		* cos(radians(latitude))
  		* cos(radians(longitude) - radians(?))
  		+ sin(radians(?))
  		* sin(radians(latitude))
  		)
  		) LIMIT 100", lat, lng, lat, lat, lng, lat]
  	end
  	near_by_cabs = self.where(available:true,:id => cab_ids ).joins(:cab_type).where(cab_type.cab_type_id.in => cab_type_id)
  end

  
end