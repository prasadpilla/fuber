class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :phone
      t.integer :age
      t.integer :cab_id, index: true

      t.timestamps null: false
    end
  end
end
