
class Lot
  attr_reader :plate, :distance_from_entry, :floor

  def initialize(plate = nil, distance_from_entry, floor)
    @plate = plate
    @distance_from_entry = distance_from_entry
    @floor = floor
  end


  def free?
    @plate ? false : true
  end

  def hold(plate)
    @plate = plate
  end

  def release
    @plate = nil
  end
end
