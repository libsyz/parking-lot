require 'csv'

class EntriesController
  def initialize
    @registry = "./registry.csv"
    @parking = ParkingLot.new
  end
  def process(request)
    @request = request
    parking.space_available?(request) ? parking : no_spots_left
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
