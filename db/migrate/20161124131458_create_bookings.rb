class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :booking_code
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status
      t.string :cab_type
      t.float :source_lat,limit:10,null: false
      t.float :source_lng,limit:10,null: false
      t.float :destination_lat, limit:10,null: false
      t.float :destination_lng, limit:10,null: false
      t.integer :cab_id, index: true
      t.integer :user_id, index: true
      
      t.timestamps null: false
    end
  end
end
