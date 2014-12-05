class DropIndexOnReadings < ActiveRecord::Migration
  def change
    # remove_index :readings, name: 'index_readings_on_recorded_at_and_station_id'
  end
end
