require_relative 'Docking_station'
require_relative 'garage'

class Van
  include BikeContainer
  attr_accessor :bikes

  def take(station)
    station.bikes.each do |x|
      bikes << x if x.broken?
    end
    station.bikes.delete_if(&:broken?)
  end

  def deliver(garage)
    bikes.each do |x|
      garage.bikes << x
    end
    bikes = []
  end

  def collect(garage)
    garage.bikes.each do |x|
      bikes << x
    end
    garage.bikes = []
  end

  def distribute(station)
    bikes.each do |x|
      station.bikes << x
    end
    bikes = []
  end
end
