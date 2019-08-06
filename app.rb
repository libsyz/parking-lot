require_relative 'parking_lot'

class Intercom
  def initialize
    @parking_lot = ParkingLot.new
    welcome
    show_menu
  end

  def welcome
    puts "###################"
    puts "Welcome to the Parking Management System"
    puts "###################"
  end

  def show_menu
    puts "What would you like to do?"
    puts "1. Check In a Vehicle"
    puts "2. Check Out A Vehicle"
    print ">"
    @input = gets.chomp
    route
  end

  def route
    case @input
    when "1"
      vehicle = get_vehicle_details
      @parking_lot.checkin(vehicle)
    when "2"
      puts "car leaving!"
      vehicle = get_vehicle_details
      @parking_lot.checkout(vehicle)
    else
      puts "Sorry option is not valid"
      show_menu
    end
  end

  def get_vehicle_details
    # ask the use for details
    # validate the input - Should complain and call menu if does not work
    # return the input
  end
end

intercom = Intercom.new

