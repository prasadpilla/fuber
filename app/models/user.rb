class User < ActiveRecord::Base
#Columns ===> name: string, email: string, phone: string
  has_many :bookings
  has_many :cabs, :through => :bookings

  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :phone
  validates_uniqueness_of :phone
  
end
