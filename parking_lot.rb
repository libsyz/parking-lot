
class ParkingLot
  attr_reader :floors
  def initialize(floors = [])
    @floors = floors
  end

  def space_available?(request)
    compatible_floors = floors.select {|f| f.vehicles_allowed.include? request.vehicle }
    compatible_floors.any? { |f| f.space_available? }
  end


end
