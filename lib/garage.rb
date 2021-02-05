class Garage
  attr_accessor :fix_list

  def initialize
    @fix_list = []
  end

  def fix
    @fix_list.each do |x|
      x.broken = false
    end
  end
end
