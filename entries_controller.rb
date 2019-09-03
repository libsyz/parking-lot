require 'csv'

class EntriesController
  def initialize(parking_lot)
    @registry = "./registry.csv"
    @parking = parking_lot
  end

  def process(request)
    binding.pry
    @request = request
    @parking.space_available?(request) ? @parking.store(request) : @parking.no_spots_left
  end

end
