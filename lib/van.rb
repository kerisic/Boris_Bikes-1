require_relative 'Docking_station'

class Van
  attr_accessor :broken_bikes

  def initialize
    @broken_bikes = []
  end

  def take(station)
  (station.bike_list).each do |x|
    if x.broken?
      @broken_bikes << x
    end
  end
  station.bike_list.delete_if {|x| x.broken? }
  end

end
