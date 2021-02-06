class Garage
include BikeContainer

attr_accessor :bikes

  def fix
    bikes.each do |x|
      x.broken = false
    end
  end
end
