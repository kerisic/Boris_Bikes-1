require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_reader :capacity
  attr_accessor :bike_list

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_list = []
  end

  def release_bike
    raise 'No bikes avaliable' if empty? || @bike_list[-1].broken? == true

    @bike_list.pop
  end

  def dock(bike)
    raise 'Station full' if full?

    @bike_list << bike
    'Bike Docked!'
  end

  def check_bike
    @bike_list.length.positive?
  end

  private

  def full?
    @bike_list.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bike_list.length.zero?
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
