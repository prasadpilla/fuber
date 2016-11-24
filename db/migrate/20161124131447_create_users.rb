class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,null: false
      t.string :email,null: false
      t.string :phone,null: false
      t.integer :booking_id, index: true
      t.float :lat, limit:10
      t.float :lng, limit:10

      t.timestamps null: false
    end
  end
end
