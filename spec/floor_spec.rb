require "rspec"
require_relative "./../floor"


describe "Floor" do
  describe "#lots" do
    it "returns an empty array when floor has no initialization params" do
      floor = Floor.new
      expect(floor.lots).to eq []
      expect(floor.lots).to be_empty
    end

    it "acts a setter for an array of lots" do
      floor = Floor.new
      floor.lots = %w(1 2 3)
      expect(floor.lots).to eq %w(1 2 3)
    end

  end

  describe "#vehicle_types" do
    it "returns an array of vehicle types that can be stored in this floor" do
      Floor.new({vehicle_types: %w(car motorbike)})
      expect(floor.vehicle_types) to eq %w(car motorbike)
    end

    it "returns an array of vehicle types that can be stored in this floor" do
    end
  end

end
