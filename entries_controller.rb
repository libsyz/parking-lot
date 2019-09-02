require 'csv'

class EntriesController
  def initialize(parking_lot)
    @registry = "./registry.csv"
    @parking = parking_lot
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
