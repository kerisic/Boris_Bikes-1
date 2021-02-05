require_relative 'Docking_station'
require_relative 'garage'

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

  def deliver(garage)
    @broken_bikes.each do |x|
      garage.fix_list << x
    end
    @broken_bikes = []
  end

end
