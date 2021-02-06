require 'van'
require 'Docking_station'
require 'garage'

describe Van do
  it { is_expected.to be_a Van }

  docking_station = DockingStation.new
  bike1 = Bike.new
  bike1.report_broken
  bike2 = Bike.new
  bike2.report_broken

  it 'takes broken bikes from docking station' do
    docking_station.dock(bike1)
    docking_station.dock(bike2)
    docking_station.dock(Bike.new)
    subject.take(docking_station)
    expect(subject.bikes.size).to eq(2)
    expect(docking_station.bikes.size).to eq(1)
  end

  it 'delivers broken bikes to garages' do
    docking_station.dock(bike1)
    docking_station.dock(bike2)
    subject.take(docking_station)
    garage = Garage.new
    subject.deliver(garage)
    expect(garage.bikes.size).to eq(2)
  end

  it 'collects working bikes from garages' do
    docking_station.dock(bike1)
    docking_station.dock(bike2)
    subject.take(docking_station)
    garage = Garage.new
    subject.deliver(garage)
    garage.fix
    subject.collect(garage)
    expect(subject.bikes[0]).not_to be_broken
  end

  it "distributes working bikes to docking stations" do
    docking_station.dock(bike1)
    docking_station.dock(bike2)
    subject.take(docking_station)
    garage = Garage.new
    subject.deliver(garage)
    garage.fix
    subject.collect(garage)
    subject.distribute(docking_station)
    expect(docking_station.bikes[0]).not_to be_broken
  end
end
