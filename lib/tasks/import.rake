require 'open-uri'
require 'ox'

namespace :import do
  desc "import data from bicing website"
  task :latest => :environment do
    url = "http://wservice.viabicing.cat/getstations.php?v=1"
    xml = Ox.parse(open(url).read)
    xml.bicing_stations.locate("station").each do |node|

      id = node.locate('id').first.text

      s = Station.find_or_create_by(id: id) do |station|
        station.street = node.locate('street').first.nodes.first.value
        station.kind = node.locate('type').first.text
        station.lat = node.locate('lat').first.text
        station.lng = node.locate('long').first.text
        station.height = node.locate('height').first.text
        station.street_number = node.locate('streetNumber').first.text
        station.nearby = node.locate('nearbyStationList').first.text
        station.status = node.locate('status').first.text
        station.slot_count = node.locate('slots').first.text.to_i
        station.bike_count = node.locate('bikes').first.text.to_i

        if (station.slot_count + station.bike_count) > 0
          station.percentage_of_bikes_available = ((station.bike_count.to_i/(station.slot_count + station.bike_count).to_f) * 100).ceil
        end

      end

      begin
        s.readings.create({
          recorded_at: xml.bicing_stations.locate("updatetime").first.nodes.first.value,
          slots: node.locate('slots').first.text,
          bikes: node.locate('bikes').first.text
        })
      rescue
      end

    end
  end
end
