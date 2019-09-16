
require 'rspec'
require_relative './../entries_controller'


describe EntriesController do
  describe "initialization" do
    it "takes a parking_lot argument to load, this becomes a parking_lot duck" do
      expect { EntriesController.new }.to raise_error(ArgumentError)
      expect { EntriesController.new("parking_lot")}.not_to raise_error
    end
  end

  context "receives a valid entry request" do
    it 'should return a success message' do
     lot = double("parking lot")
     request = double("request")
     allow(lot).to receive(:space_available?) { true }
     allow(lot).to receive(:holds?).with(request) { true }
     allow(lot).to receive(:store).with(request)
     entries = EntriesController.new(lot)
     entries.process(request)
     expect(lot).to have_received(:store).with(request)
    end
  end

  context "receives an invalid entry request - duplicated plate" do
    it 'should return an error message' do
    end
  end

  context "receives an invalid entry request - plate not found" do
    it 'should return an error message' do
    end
  end
end
