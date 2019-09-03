require 'csv'

class ParkingLot
  attr_reader :floors

  def initialize(floors = [])
    @floors = floors
    @csv_file = './registry.csv'
  end

  def space_available?(request)
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
    "#{request.vehicle} - plate: #{request.plate} is now stored at lot #{lot.distance_from_entry}"
  end


  def release_lot(request)
    all_busy_lots.each do |lot|
      lot.release if lot.plate == request.plate
    end
    save_to_csv
  end

  def load_csv
    csv = CSV.parse(File.open(@csv_file))
    csv.each do |row|
      lot = all_lots.flatten.find {|lot| lot.distance_from_entry == row[0].to_i}
      lot.hold(row[1])
    end
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
        csv << [lot.plate, lot.distance_from_entry]
      end
    end
  end
end


