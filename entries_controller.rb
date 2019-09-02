require 'csv'

class EntriesController
  def initialize
    @registry = "./registry.csv"
  end
  def process(request)
    CSV.open(@registry, "wb") do |csv|
      puts request
      csv << [request.action, request.plate, request.vehicle]

    ## Discern what kind of car is it
    ## If there is space for this kind of car
    ## Store it with a timestamp and return a message
    end
    puts "#{request} entered successfully"
  end
end
