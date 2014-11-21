class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :kind
      t.float :lat
      t.float :lng
      t.string :street
      t.string :street_number
      t.integer :height
      t.string :status
      t.string :nearby
      t.integer :slots
      t.integer :bikes

      t.timestamps null: false
    end
    add_index :stations, [:kind,:status]
    add_index :stations, [:lat,:lng]
  end
end
