require_relative 'van'
require_relative 'garage'
require_relative 'bike_container'

class DockingStation
  include BikeContainer
  attr_accessor :bikes, :capacity

  def release_bike
    raise 'No bikes avaliable' if empty? || @bikes[-1].broken? == true
    bikes.delete working_bikes.pop
  end

  def dock(bike)
    raise 'Station full' if full?
    @bikes << bike
    'Bike Docked!'
  end

  def check_bike
    @bikes.length.positive?
  end

  private

  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end

  def working_bikes
    bikes.reject{ |bike| bike.broken? }
  end

end

class Bike
  attr_accessor :broken

  def initialize
    @working = true
    @broken = false
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def working?
    @working
  end
end
