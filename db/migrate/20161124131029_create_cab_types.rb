class CreateCabTypes < ActiveRecord::Migration
  def change
    create_table :cab_types do |t|
      t.string :cab_type
      t.decimal :base_fare,null: false
      t.decimal :per_mile_fare,null: false
      t.decimal :per_minute_fare,null: false
      t.decimal :miles_with_in_base_fare, null: false

      t.timestamps null: false
    end
  end
end
