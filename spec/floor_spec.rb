require "rspec"
require_relative "./../floor"


describe "Floor" do
  describe "#capacity" do
    it "returns an integer representing the amount of lots that fit within the floor" do
      floor = Floor.new({capacity: 10})
      expect(floor.capacity).to eq 10
    end

    it "throws an error if capacity is not present on initialization" do
      expect { Floor.new }.to raise_error "capacity must be present on initialization params"
    end
  end

  describe "#lots" do
    it "returns an empty array when floor has no initialization params" do
      floor = Floor.new({capacity: 10})
      expect(floor.lots).to eq []
      expect(floor.lots).to be_empty
    end

    it "acts a setter for an array of lots" do
      floor = Floor.new({capacity: 10})
      floor.lots = %w(1 2 3)
      expect(floor.lots).to eq %w(1 2 3)
    end

    it "should behave like an array - for instance, allows use of #concat or #push" do
      floor = Floor.new({capacity: 10})
      floor.lots = %w(1 2 3)
      expect(floor.lots).to respond_to(:concat)
      expect(floor.lots).to respond_to(:push)
    end
  end

  describe "#vehicle_types" do
    it "returns an array of vehicle types that can be stored in this floor" do
      floor = Floor.new({capacity: 10, vehicle_types: %w(car motorbike)})
      expect(floor.vehicle_types).to eq %w(car motorbike)
    end

    it "returns an array of vehicle types that can be stored in this floor" do
      floor = Floor.new({capacity: 10, vehicle_types: %w(car motorbike)})
      expect(floor.vehicle_types.class).to eq Array
    end
  end

  describe "#full?" do
    it "returns true when there are all lots respond false to being free" do
      floor = Floor.new({capacity: 10})
      filled_lot = double("filled_lot")
      allow(filled_lot).to receive(:free?).and_return(false)
      floor.lots = Array.new(10) { |el| el = filled_lot }
      expect(floor.full?).to eq true
    end

    it "returns false when at least one lot responds true to being available" do
      floor = Floor.new({capacity: 10})
      filled_lot = double("filled_lot")
      allow(filled_lot).to receive(:free?).and_return(false)
      free_lot = double("free_lot")
      allow(free_lot).to receive(:free?).and_return(true)
      floor.lots = Array.new(9) { |el| el = filled_lot }
      floor.lots << free_lot
      expect(floor.full?).to eq false
    end
  end

  describe "#allows_vehicle?(arg)" do
    it "returns true when the parameters are part of #vehicle_types" do
      floor = Floor.new({capacity: 10, vehicle_types: %w(car motorbike)})
      expect(floor.allows_vehicle?("car")).to be_truthy
    end

    it "returns false when the vehicle is not part of #vehicle_types" do
      floor = Floor.new({capacity: 10, vehicle_types: %w(car motorbike)})
      expect(floor.allows_vehicle?("bus")).to be_falsey
    end
  end

end

