

class ExitsController

  def initialize(parking_lot)
    @parking = parking_lot
  end

  def process(request)
    binding.pry
    @parking.release_lot(request)
    "vehicle number #{request.plate} has exited the parking!"
  rescue
    "Something went wrong!"
  end
end
