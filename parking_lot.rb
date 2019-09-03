
class ParkingLot
  attr_reader :floors
  def initialize(floors = [])
    @floors = floors
  end

  def space_available?(request)
    @request = request
    compatible_floors.any? { |f| f.space_available? }
  end


  def store(request)
    floor = compatible_floors.find {|f| f.space_available? }
    lot = floor.lots.find {|l| l.free? }
    lot.hold(request)
    "#{request.vehicle} - plate: #{request.plate} is now stored at lot #{lot.distance_from_entry}"
    # Should write to csv now!
  end

  private

  def compatible_floors
    floors.select {|f| f.vehicles_allowed.include? @request.vehicle }
  end

end

