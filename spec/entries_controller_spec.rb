
require 'rspec'
require_relative './../entries_controller'


describe EntriesController do
  describe "initialization" do
    it "takes a parking_lot argument to load, this becomes a parking_lot duck" do
      expect { EntriesController.new }.to raise_error(ArgumentError)
      expect { EntriesController.new("parking_lot")}.not_to raise_error
    end
  end
end
