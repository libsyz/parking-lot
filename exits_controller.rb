

class ExitsController

  def initialize(parking_lot)
    @parking = parking_lot
  end

  def process(request)
    if @parking.holds?(request)
      @parking.release_lot(request)
    else
      @parking.not_found
    end
  end
end
