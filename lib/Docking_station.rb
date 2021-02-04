class DockingStation
	attr_reader :bike_list

  DEFAULT_CAPACITY = 20

	def initialize
		@bike_list = []
	end

	def release_bike
    raise "No bikes avaliable" if empty?
	  @bike_list.pop
	end

	def dock(bike)
    raise "Station full" if full?
		@bike_list << bike
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

  def working?
    true
  end

end
