class Station < ActiveRecord::Base

  has_paper_trail ignore: [:slot_count,:bike_count, :percentage_of_bikes_available]
  has_many :readings

  before_save :update_average
  after_touch :update_average

  def update_average
    if total_count > 0
      self.percentage_of_bikes_available = ((bikes / total_count.to_f) * 100).ceil
    else
      self.percentage_of_bikes_available = nil
    end
  end

  def total_count
    bikes + slots
  end

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
    case bikes
      when 0
        "white"
      else
        "red"
        # "rgba(255,255,1,1)"
      # when 1..34
      #   # "#07BADB"
      #   "rgba(255,255,1,0.3)"
      # when 35..37
      #   # "#78E268"
      #   "rgba(255,255,1,0.5)"
      # when 51..99
      #   # "#FEFF57"
      #   "rgba(255,255,1,0.7)"
      # else
      #   # "#FF4A53"
      #   "rgba(255,255,1,1)"
      end
  end

  def total_slots
    bikes + slots
  end


end
