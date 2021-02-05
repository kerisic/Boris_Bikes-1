require 'van'
require 'Docking_station'
require 'garage'

describe Garage do

  docking_station = DockingStation.new
  bike1 = Bike.new
  bike2 = Bike.new
  bike1.report_broken
  bike2.report_broken
  docking_station.dock(bike1)
  docking_station.dock(bike2)
  van = Van.new
  van.take(docking_station)
  garage = Garage.new
  van.deliver(garage)

  it "fixes broken bikes so that they are working again" do
    garage.fix
    expect(garage.fix_list[0]).not_to be_broken
    expect(garage.fix_list[1]).not_to be_broken
  end

end
