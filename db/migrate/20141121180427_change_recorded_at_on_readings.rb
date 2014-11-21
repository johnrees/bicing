class ChangeRecordedAtOnReadings < ActiveRecord::Migration
  def change
    change_column :readings, :recorded_at, :datetime
  end
end
