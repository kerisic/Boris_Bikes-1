require 'van'
require 'Docking_station'

describe Van do
  it {is_expected.to be_a Van}

  it 'takes broken bikes from docking station' do
    docking_station = DockingStation.new
    bike1 = Bike.new
    bike1.report_broken
    bike2 = Bike.new
    bike2.report_broken
    docking_station.dock(bike1)
    docking_station.dock(bike2)
    docking_station.dock(Bike.new)
    subject.take(docking_station)
    expect(subject.broken_bikes.size).to eq (2)
    expect(docking_station.bike_list.size).to eq (1)
  end

end
