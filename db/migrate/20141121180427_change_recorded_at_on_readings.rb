class ChangeRecordedAtOnReadings < ActiveRecord::Migration

  def up
    Reading.delete_all
    remove_column :readings, :recorded_at
    add_column :readings, :recorded_at, :datetime
    add_index :readings, [:station_id, :recorded_at], unique: true
  end

  def down
    remove_column :readings, :recorded_at
    add_column :readings, :recorded_at, :integer
    remove_index :readings, [:station_id, :recorded_at]
  end

end
