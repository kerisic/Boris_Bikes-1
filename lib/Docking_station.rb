class DockingStation
	attr_reader :bike_list, :capacity

  DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@bike_list = []
	end

	def release_bike
    raise "No bikes avaliable" if empty?
	  @bike_list.pop
	end

	def dock(bike, working = true)
    raise "Station full" if full?
		@bike_list << bike
		if !working
			bike.working = false
		end
		return "Bike Docked!"
	end

	def check_bike
		if @bike_list.length > 0
			return true
		else return false
		end
	end

  private
  def full?
    @bike_list.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bike_list.length == 0
  end

end

class Bike

	attr_accessor :working

	def initialize
		@working = true
	end

  def working?
    @working
  end

end
