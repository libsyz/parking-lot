require 'csv'

class ParkingLot
  attr_reader :floors

  def initialize(floors = [])
    @floors = floors
    @csv_file = './registry.csv'
  end

  def space_available?(request)
    return false if holds?(request)
    @request = request
    compatible_floors.any? { |f| f.space_available? }
  end

  def holds?(request)
    all_busy_lots.any? {|lot| lot.plate == request.plate }
  end

  def store(request)
    floors = compatible_floors.find {|f| f.space_available? }
    lot = floors.lots.find {|l| l.free? }
    lot.hold(request.plate)
    save_to_csv
    "plate: #{request.plate} Please proceed to spot #{lot.distance_from_entry}, floor number #{lot.floor.number}"
  end

  def release_lot(request)
    all_busy_lots.each do |lot|
      if lot.plate == request.plate
        lot.release
        save_to_csv
        return "Spot #{lot.distance_from_entry} in Floor #{lot.floor.number} is now free"
      end
    end
  end

  def load_csv
    csv = CSV.parse(File.open(@csv_file))
    csv.each do |row|
      lot = all_lots.flatten.find {|lot| lot.distance_from_entry == row[0].to_i}
      lot.hold(row[1])
    end
  end


  def no_spots_left
    "Sorry! There are no spaces left - Check out a bus to continue"
  end

  def not_found
    "Sorry, this vehicle does not seem to be checked in"
  end

  private

  def compatible_floors
    floors.select {|f| f.vehicles_allowed.include? @request.vehicle }
  end

  def all_busy_lots
    all = []
    floors.each {|f| all.concat(f.lots) }
    all.select {|lot| lot.free? == false }
  end

  def all_lots
    [] << floors.map {|floor| floor.lots }
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      all_busy_lots.each do |lot|
        csv << [lot.distance_from_entry, lot.plate]
      end
    end
  end
end


