class StationsController < ApplicationController

  def index
    # @stations = Station.eager_load(:readings)
    @stations = Station.eager_load(:readings).order("readings.recorded_at DESC")
  end

  def map
    # @readings = Reading.maximum("recorded_at").where("readings.recorded_at <= ?", (params[:datetime] ? (params[:datetime].to_datetime - 1.hour) : Time.now)).order("readings.recorded_at DESC")
    @stations = Station.eager_load(:readings).where("readings.recorded_at <= ?", (params[:datetime] ? (params[:datetime].to_datetime - 1.hour) : Time.now)).group('readings.id').order("readings.recorded_at DESC")
    @reading = @stations.first.latest_reading
    render :map, layout: false
  end

end
