class StationsController < ApplicationController

  def index
    @stations = Station.eager_load(:readings)
  end

  def map
    @stations = Station.eager_load(:readings).order("readings.recorded_at DESC")
  end

end
