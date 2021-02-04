require 'Docking_station'

describe DockingStation do
	it { is_expected.to respond_to(:release_bike)}
	it { is_expected.to respond_to(:check_bike)}

  docking_station = DockingStation.new
  let(:bike) {double :bike}

	it 'release a bike' do
		docking_station.dock(Bike.new)
		bike = docking_station.release_bike
    expect(bike).to be_instance_of Bike
  end

  it 'check if its working' do
		allow(bike).to receive(:working?).and_return(true)
    expect(bike.working?).to eq true
	end

	it 'can set a different capacity when initialized' do
		expect(DockingStation.new(30).capacity).to eq(30)
	end

	it 'will return a default capacity of 20 when none is specified' do
		expect(DockingStation.new.capacity).to eq(20)
	end

	# dock is a method held by DockingStation, taking an argument of (bike)

	it 'can dock a bike' do
		expect(docking_station.dock(double(:bike))).to eq "Bike Docked!"
	end

	it 'should return true if a bike is available' do
    # docking_station.dock(bike)
		expect(docking_station.check_bike).to be true
	end

  it 'return error if release method called on empty station' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error("No bikes avaliable")
  end

  it 'return error if dock method called on full station' do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times {docking_station.dock(Bike.new)}
    expect { docking_station.dock(double(:bike)) }.to raise_error("Station full")
  end

	it 'be able to report broken bike' do
		bike = double(:bike, report_broken: false, working?: false)
		bike.report_broken
		expect(bike.working?).to eq(false)
	end

	it 'should not release a broken bike' do
		bike = double(:bike, working?: false)
		dockingstation = DockingStation.new
		#allow(bike).to receive(:working?).and_return(false)
		dockingstation.dock(bike)
		expect{ dockingstation.release_bike }.to raise_error("No bikes avaliable")
  end
end
