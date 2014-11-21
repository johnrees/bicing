class Reading < ActiveRecord::Base
  belongs_to :station

  default_scope -> { order('recorded_at DESC') }


  def to_s
    "[Bikes: #{bikes}, Slots: #{slots}, at: #{created_at.stamp('15:33:22 30/10')}]"
  end

end
