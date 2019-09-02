
class ParkingLot
  def initialize(floors = [])
    @floors = []
  end

  def space_available?(request)

    # return false if all spots are taken
    # If the request is for a large vehicle,
      # assign to the closest to entry spot - first floor
    # If the request is for a small vehicle
      # assign to the closes to entry spot - second and third floor

    # If the assignment has happened, write to CSV file
  end


end
