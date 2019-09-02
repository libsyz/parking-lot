require 'csv'

class EntriesController
  def initialize(parking_lot)
    @registry = "./registry.csv"
    @parking = parking_lot
  end

  def process(request)
    binding.pry
    @request = request
    @parking.space_available?(request) ? "Ready to store vehicle" : no_spots_left
  end

  def store
    CSV.open(@registry, "wb") do |csv|
      puts @request
      csv << [request.action, request.plate, request.vehicle]
    end
    puts "#{@request} entered successfully"
  end


  def no_spots_left
    "Sorry! There are no spaces left"
  end
end
