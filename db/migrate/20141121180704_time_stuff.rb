class TimeStuff < ActiveRecord::Migration
  def change
    Reading.all.each do |r|
      r.update_attribute(:recorded_at, Time.at(r.recorded_at))
    end
  end
end
