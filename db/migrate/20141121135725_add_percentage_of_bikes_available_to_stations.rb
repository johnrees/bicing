class AddPercentageOfBikesAvailableToStations < ActiveRecord::Migration
  def change
    add_column :stations, :percentage_of_bikes_available, :integer
  end
end
