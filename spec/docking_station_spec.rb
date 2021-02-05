require 'Docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:check_bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }

  docking_station = DockingStation.new
  let(:bike) { double :bike }

  it 'release a bike' do
    docking_station.dock(Bike.new)
    bike = docking_station.release_bike
    expect(bike).to be_instance_of Bike
  end

  it 'can set a different capacity when initialized' do
    expect(DockingStation.new(30).capacity).to eq(30)
  end

  it 'will return a default capacity of 20 when none is specified' do
    expect(DockingStation.new.capacity).to eq(20)
  end

  it 'can dock a bike' do
    expect(docking_station.dock(double(:bike))).to eq 'Bike Docked!'
  end

  it 'return error if release method called on empty station' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error('No bikes avaliable')
  end

  it 'return error if dock method called on full station' do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(Bike.new) }
    expect { docking_station.dock(double(:bike)) }.to raise_error('Station full')
  end

  it 'releases working bikes' do
    dockingstation = DockingStation.new
    bike = double(:bike, broken?: false)
    dockingstation.dock bike
    expect(dockingstation.release_bike).to be bike
  end

  it 'should not release a broken bike' do
    bike = double(:bike, broken?: true)
    dockingstation = DockingStation.new
    dockingstation.dock(bike)
    expect { dockingstation.release_bike }.to raise_error('No bikes avaliable')
  end
end

describe Bike do
  it 'be able to report broken bike' do
    bike = Bike.new
    bike.report_broken
    expect(bike).to be_broken
  end

  it 'check if its working' do
    bike = Bike.new
    expect(bike.working?).to eq true
  end
end
