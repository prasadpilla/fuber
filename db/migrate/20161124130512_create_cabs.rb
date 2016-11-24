class CreateCabs < ActiveRecord::Migration
  def change
    create_table :cabs do |t|
      t.string :cab_model
      t.string :reg_no
      t.string :color
      t.integer :booking_id, index: true
      t.integer :cab_type_id, index: true
      t.integer :driver_id, index: true
      t.float :lat, limit:10, index:true
      t.float :lng, limit:10, index:true

      t.timestamps null: false
    end
  end
end
