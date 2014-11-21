class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.belongs_to :station
      t.integer :bikes
      t.integer :slots
      t.integer :recorded_at

      t.timestamps null: false
    end
    add_index :readings, [:recorded_at, :station_id], unique: true
  end
end
