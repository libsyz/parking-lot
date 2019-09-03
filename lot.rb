
class Lot
  attr_reader :plate, :distance_from_entry

  def initialize(plate = nil, distance_from_entry)
    @plate = plate
    @distance_from_entry = distance_from_entry
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
