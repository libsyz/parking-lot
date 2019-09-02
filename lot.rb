
class Lot
  attr_reader :plate

  def initialize(plate = nil, distance_from_entry)
    @plate = plate
    @distance_from_entry = distance_from_entry
    @plate ? @free = false : @free = true
  end


  def free?
    @free
  end

  def hold(plate)
    @plate = plate
    @free = false
  end

  def release
    @plate = nil
    @free = true
  end
end
