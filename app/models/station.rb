class Station < ActiveRecord::Base

  has_paper_trail ignore: [:slot_count,:bike_count]
  has_many :readings

  default_scope -> { where(status: 'OPN') }

  # scope :empty, -> { where(percentage_of_bikes_available: 0) }
  scope :full, -> { where(percentage_of_bikes_available: 100) }

  def to_s
    [human_street,street_number].reject(&:blank?).join(', ')
  end

  def human_street
    HTMLEntities.new.decode(street)
  end

  def bikes
    latest_reading.bikes
  end

  def slots
    latest_reading.slots
  end

  def latest_reading
    readings.first
  end

  def colour
    case percentage_of_bikes_available
      when 0
        "black"
      when 1..34
        # "#07BADB"
        "rgba(255,255,1,0.3)"
      when 35..37
        # "#78E268"
        "rgba(255,255,1,0.5)"
      when 51..99
        # "#FEFF57"
        "rgba(255,255,1,0.7)"
      else
        # "#FF4A53"
        "rgba(255,255,1,1)"
      end
  end

  def total_slots
    bikes + slots
  end


end
