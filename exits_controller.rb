

class ExitsController

  def initialize(parking_lot)
    @parking = parking_lot
  end

  def process(request)
    if @parking.holds?(request)
      @parking.release_lot(request)
      "vehicle number #{request.plate} has exited the parking!"
    else
      "Sorry, this vehicle does not seem to be in the parking"
    end
  end
end
