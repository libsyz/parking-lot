require 'csv'
require 'rspec'
require_relative './../parking_lot'

describe ParkingLot do
  describe "initialization" do
    it 'takes an optional array with lots to initialize' do
      expect { ParkingLot.new }.not_to raise_error
      expect { ParkingLot.new(["lot", "lot"]) }.not_to raise_error
    end

    it 'takes an optional string for a csv file to be loaded' do
      expect { ParkingLot.new([])}.not_to raise_error
      parking_lot = ParkingLot.new([], "./some_registry.csv")
      expect(parking_lot.csv_file).to eq "./some_registry.csv"
    end

    it 'pulls a static registry csv file if no file is specified' do
      parking = ParkingLot.new
      expect(parking.csv_file).to eq './registry.csv'
    end

  end
end
