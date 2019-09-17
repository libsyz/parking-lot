require 'rspec'
require_relative './../exits_controller'

describe ExitsController do

  describe "initialization" do
    it "needs a parking lot to initialize" do
      expect { ExitsController.new }.to raise_error ArgumentError
      expect { ExitsController.new("a parking lot")}.not_to raise_error
    end
  end

  describe "#process" do
    context "receives a request for a vehicle that is in the parking" do
      it "should return a success message to the user" do
        parking_lot = double("A parking lot")
        request = double("A request")
        allow(parking_lot).to receive(:holds?).with(request).and_return(true)
        allow(parking_lot).to receive(:release_lot).with(request).and_return("success!")
        exits = ExitsController.new(parking_lot)
        expect(exits.process(request)).to eq "success!"
      end
    end


    context "receives a request for a vehicle that is NOT in the parking" do
      it "should return an error message to the user" do
        parking_lot = double("A parking lot")
        request = double("A request")
        allow(parking_lot).to receive(:holds?).with(request).and_return(false)
        allow(parking_lot).to receive(:release_lot).with(request).and_return("success!")
        exits = ExitsController.new(parking_lot)
        expect(exits.process(request)).to eq "This vehicle plate does not appear to be checked in"
      end
    end
  end
end
