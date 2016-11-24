class Driver < ActiveRecord::Base
#Columns ===> name: string, phone: string, age: integer
  belongs_to :cab

  validates_presence_of :name
  validates_presence_of :phone
  validates_uniqueness_of :phone
end
