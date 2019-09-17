
require 'rspec'
require_relative './../entries_controller'

describe EntriesController do
  describe "initialization" do
    it "takes a parking_lot argument to load, this becomes a parking_lot duck" do
      expect { EntriesController.new }.to raise_error(ArgumentError)
      expect { EntriesController.new("parking_lot")}.not_to raise_error
    end
  end

  describe "#process" do
    before(:each) do
      @request = double("request")
      @lot = double("parking lot")
      allow(@lot).to receive(:store).with(@request).and_return("success")
    end

    context "receives a request for a vehicle that can be stored in the parking" do
      it 'should return a success message' do
        allow(@lot).to receive(:holds?).with(@request) { false }
        allow(@lot).to receive(:space_available?).with(@request) { true }
        entries = EntriesController.new(@lot)
        expect(entries.process(@request)).to eq "success"
     end
   end

    context "receives an invalid entry request - duplicated plate" do
      it 'should return an error message' do
        allow(@lot).to receive(:holds?).with(@request) { true }
        allow(@lot).to receive(:space_available?).with(@request) { true }
        entries = EntriesController.new(@lot)
        expect(entries.process(@request)).to eq "This vehicle has already been checked in the parking"
      end
    end

    context "receives an invalid entry request - no space available for this vehicle" do
      it 'should return an error message' do
        allow(@lot).to receive(:holds?).with(@request) { false }
        allow(@lot).to receive(:space_available?).with(@request) { false }
        entries = EntriesController.new(@lot)
        expect(entries.process(@request)).to eq "Sorry! There are no spaces left - Check out a bus to continue"
      end
    end
  end
end
