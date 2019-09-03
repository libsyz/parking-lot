require 'csv'

class EntriesController
  def initialize(parking_lot)
    @registry = "./registry.csv"
    @parking = parking_lot
  end

  def process(request)
    binding.pry
    @request = request
    @parking.space_available?(request) ? @parking.store(request) : no_spots_left
  end


  def no_spots_left
    "Sorry! There are no spaces left - Check out a #{@request.type} to continue"
  end
end
